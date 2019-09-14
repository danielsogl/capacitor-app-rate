import Foundation
import Capacitor
import StoreKit

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(AppRate)
public class AppRate: CAPPlugin {
    
    var storeId = ""
    var usesUntilPrompt = 5
    
    @objc func setConfig(_ call: CAPPluginCall) {
        storeId = call.getString("iosId") ?? ""
        usesUntilPrompt = call.getInt("usesUntilPrompt") ?? 5
        call.resolve()
    }
    
    @objc func navigateToAppStore(_ call: CAPPluginCall) {
        guard let writeReviewURL = URL(string: "https://itunes.apple.com/app/id" + storeId + "?action=write-review")
            else {
                call.error("Invalid app id")
                fatalError("Expected a valid URL")
        }
        DispatchQueue.main.async {
            UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
            call.resolve();
        }
    }
    
    @objc func promptForRating(_ call: CAPPluginCall) {
        let force = call.getBool("force") ?? false;
        
        if(force) {
            DispatchQueue.main.async {
                SKStoreReviewController.requestReview()
            }
        } else {
            var count = UserDefaults.standard.integer(forKey: "processCompletedCountKey")
            count += 1
            UserDefaults.standard.set(count, forKey: "processCompletedCountKey")
            
            // Get the current bundle version for the app
            let infoDictionaryKey = kCFBundleVersionKey as String
            guard let currentVersion = Bundle.main.object(forInfoDictionaryKey: infoDictionaryKey) as? String
                else {
                    call.error("Expected to find a bundle version in the info dictionary")
                    fatalError("Expected to find a bundle version in the info dictionary")
            }
            
            let lastVersionPromptedForReview = UserDefaults.standard.string(forKey: "lastVersionPromptedForReviewKey")
            
            // Has the process been completed several times and the user has not already been prompted for this version?
            if count >= usesUntilPrompt && currentVersion != lastVersionPromptedForReview {
                DispatchQueue.main.async() {
                    SKStoreReviewController.requestReview()
                    UserDefaults.standard.set(currentVersion, forKey: "lastVersionPromptedForReviewKey")
                }
            }
        }
        call.resolve();
    }
}
