//
//  AppDelegate.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 1. 24..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import ADXLibrary
import GoogleMobileAds

let BANNER_AD_UNIT_ID           = "a9bcfae03030442da3ed277aff98713c"
let INTERSTITIAL_AD_UNIT_ID     = "f6110c24fa8a4daf9c6159f5ea181e7d"
let NATIVE_AD_UNIT_ID           = "9ab55b93573b43869da0c47bd0780cd1"
let REWARDEDVIDEO_AD_UNIT_ID    = "756f6366d71f4bef88ae55c5ac13ac36"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        NativeAdFactory.sharedInstance().setRenderingViewClass(NATIVE_AD_UNIT_ID, renderingViewClass: NativeAdView.self)
        NativeAdFactory.sharedInstance().preloadAd(NATIVE_AD_UNIT_ID)
        
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: "ca-app-pub-7466439784264697~7972777801")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

