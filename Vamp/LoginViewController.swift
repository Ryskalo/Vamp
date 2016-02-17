//
//  LoginViewController.swift
//  Vamp
//
//  Created by Антон Рыскалев on 12.10.15.
//  Copyright © 2015 Антон Рыскалев. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, VKSdkDelegate {
    
    var scope = ["friends"]
    
    enum userToken {
        static let token = "..."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        VKSdk.initializeWithDelegate(self, andAppId: "5103836")
        
        
        if (!VKSdk.wakeUpSession()) {
            VKSdk.authorize(scope, revokeAccess: true, forceOAuth: false, inApp: true)
            self.performSegueWithIdentifier("goToMainViewController", sender: self)
        } else {
            self.performSegueWithIdentifier("goToMainViewController", sender: self)
            print("2")
        }
        
    }
    
    
    func vkSdkNeedCaptchaEnter(captchaError : VKError) {
        print("vkSdkNeedCaptchaEnter")
    }
    
    func vkSdkAcceptedUserToken(token: VKAccessToken!) {
        print(" vkSdkAcceptedUserToken")
    }
    
    func vkSdkTokenHasExpired(expiredToken : VKAccessToken) {
        print("vkSdkTokenHasExpired")
    }
    
    func vkSdkUserDeniedAccess(authorizationError : VKError) {
        print("vkSdkUserDeniedAccess")
    }
    
    func vkSdkShouldPresentViewController(controller : UIViewController) {
        print("vkSdkShouldPresentViewController")
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    func vkSdkReceivedNewToken(newToken : VKAccessToken) {
        }
    
    
    
    func vkSdkIsBasicAuthorization() -> Bool {
        //var request = VKApi.friends()
        print("vkSdkIsBasicAuthorization")
        return true
        


        
}
    
}