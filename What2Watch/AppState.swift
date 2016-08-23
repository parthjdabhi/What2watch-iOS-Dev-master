//
//  AppState.swift
//  What2Watch
//
//  Created by Dustin Allen on 7/15/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import Foundation
import Firebase

class AppState: NSObject {
    
    static let sharedInstance = AppState()
    
    var signedIn = false
    var displayName: String?
    var myProfile: UIImage?
    var photoUrl: NSURL?
    var currentUser: FIRDataSnapshot!
    var movieWatched: String?
    var timeWatched: String?
    var watchlistCount: String?
    
    var accu_All_top2000: Dictionary<String,Int>?
    var accu_Like_top2000: Dictionary<String,Int>?
    var accu_Dislike_top2000: Dictionary<String,Int>?
    var accu_Watched_top2000: Dictionary<String,Int>?
    var accu_Havnt_top2000: Dictionary<String,Int>?
    
    var movies: Array<[String:AnyObject]>? = []
    
    var clrYellow: UIColor? = UIColor(red: (255.0/255.0), green: (204.0/255.0), blue: (1.0/255.0), alpha: 1)
    
    static func MyUserID() -> String {
        return FIRAuth.auth()?.currentUser?.uid ?? ""
    }
    
    static func Logout() {
        NSUserDefaults.standardUserDefaults().removeObjectForKey("lastSwiped_top2000")
        
    }
}

let globalGroup = dispatch_group_create();
let queue = NSOperationQueue()