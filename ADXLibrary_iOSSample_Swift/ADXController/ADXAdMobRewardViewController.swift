//
//  ADXAdMobRewardViewController.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 4. 18..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ADXAdMobRewardViewController: UIViewController, GADFullScreenContentDelegate {
    
    var rewardedAd: GADRewardedAd?
    var REWARDEDVIDEO_AD_UNIT_ID = "ca-app-pub-7466439784264697/6572954274"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "e20af00f58944a24199be16334aa148f" ];
        
        createAndLoadRewardedAd()
    }
    
    func createAndLoadRewardedAd() {
        GADRewardedAd.load(withAdUnitID: REWARDEDVIDEO_AD_UNIT_ID, request: GADRequest()) { (rewardedAd, error) in
            if let error = error {
                print("Loading failed: \(error)")
            } else {
                print("Loading Succeeded")
                self.rewardedAd = rewardedAd;
                self.rewardedAd?.fullScreenContentDelegate = self;
            }
        }
    }
    
    @IBAction func selectShowAd(_ sender: Any) {
        if (rewardedAd != nil) {
            rewardedAd?.present(fromRootViewController: self, userDidEarnRewardHandler: {
                if let reward = self.rewardedAd?.adReward {
                    print("Reward received with currency: \(reward.type), amount \(reward.amount).")
                }
            })
        } else {
            createAndLoadRewardedAd()
        }
    }
    
    // MARK: - GADFullScreenContentDelegate
    
    func adDidRecordImpression(_ ad: GADFullScreenPresentingAd) {
        print("adDidRecordImpression")
    }
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Rewarded ad failed to present.")
    }
    
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Rewarded ad presented.")
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Rewarded ad dismissed.")
          
          createAndLoadRewardedAd()
    }

    // MARK: -
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
