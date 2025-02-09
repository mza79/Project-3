//
//  AppDelegate.swift
//  DrawPad
//
//  Created by Jean-Pierre Distler on 13.11.14.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//
//  Modified by Janice Chan, Sera Yang, Kenny Yuan as part of project Project in 2017

import UIKit
import Firebase
import FirebaseAuth
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var uid: String!
    var authRef: FirebaseAuth.Auth!
    
    override init() {
        super.init()
        FirebaseApp.configure()

    }
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
        -> Bool {
            authRef = Auth.auth()


            if (authRef.currentUser == nil) {
            authRef.signInAnonymously(completion: { (user, error) in
                if error != nil {
                    print("failed")
                    return
                }
                print ("User logged in anonymously with uid: " + user!.uid)
                self.uid = user!.uid
                
            })
            }
            else {
                self.uid = authRef.currentUser!.uid
            }
            
            
            return true
    }

    func getUID() -> String {
        return uid
    }
    
    func getAuthRef() -> FirebaseAuth.Auth {
        return authRef
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

