//
//  FirstLoginCheck.swift
//  αBaro
//
//  Created by Situo Meng on 4/11/16.
//  Copyright © 2016 Ethereo. All rights reserved.
//

import Foundation

class FirstLoginCheck {
    private static var userDefaults = NSUserDefaults.standardUserDefaults()
    private static let signInKey = "SIGNIN"
    
    class func isSignedIn() -> Bool {
        return userDefaults.boolForKey(signInKey)
    }
    
    class func signIn() {
        userDefaults.setBool(true, forKey: signInKey)
    }
    
    class func signOut() {
        userDefaults.setBool(false, forKey: signInKey)
    }
}
