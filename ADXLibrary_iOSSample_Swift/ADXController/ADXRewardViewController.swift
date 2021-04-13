//
//  ADXRewardViewController.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 4. 6..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import MoPubSDK

class ADXRewardViewController: UIViewController, MPRewardedAdsDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MPRewardedAds.loadRewardedAd(withAdUnitID: REWARDEDVIDEO_AD_UNIT_ID, withMediationSettings: nil)
        MPRewardedAds.setDelegate(self, forAdUnitId: REWARDEDVIDEO_AD_UNIT_ID)
    }
    
    @IBAction func selectShowAd(_ sender: Any) {
        if (MPRewardedAds.hasAdAvailable(forAdUnitID: REWARDEDVIDEO_AD_UNIT_ID)) {
            MPRewardedAds.presentRewardedAd(forAdUnitID: REWARDEDVIDEO_AD_UNIT_ID, from: self, with: nil)
        } else {
            MPRewardedAds.loadRewardedAd(withAdUnitID: REWARDEDVIDEO_AD_UNIT_ID, withMediationSettings: nil)
        }
    }
    
    // MARK: - MPRewardedAdsDelegate
    
    func rewardedAdDidLoad(forAdUnitID adUnitID: String!) {
        print("rewardedAdDidLoad : \(adUnitID!)")
    }
    
    func rewardedAdDidPresent(forAdUnitID adUnitID: String!) {
        print("rewardedAdDidPresent : \(adUnitID!)")
    }

    func rewardedAdDidExpire(forAdUnitID adUnitID: String!) {
        print("rewardedAdDidExpire : \(adUnitID!)")
    }
    
    func rewardedAdWillPresent(forAdUnitID adUnitID: String!) {
        print("rewardedAdWillPresent : \(adUnitID!)")
    }
    
    func rewardedAdDidDismiss(forAdUnitID adUnitID: String!) {
        print("rewardedAdDidDismiss : \(adUnitID!)")
    }
    
    func rewardedAdWillDismiss(forAdUnitID adUnitID: String!) {
        print("rewardedAdWillDismiss : \(adUnitID!)")
    }
    
    func rewardedAdDidReceiveTapEvent(forAdUnitID adUnitID: String!) {
        print("rewardedAdDidReceiveTapEvent : \(adUnitID!)")
    }

    func rewardedAdWillLeaveApplication(forAdUnitID adUnitID: String!) {
        print("rewardedAdWillLeaveApplication : \(adUnitID!)")
    }
    
    func rewardedAdDidFailToLoad(forAdUnitID adUnitID: String!, error: Error!) {
        print("rewardedVideoAdDidFailToLoad : \(adUnitID!)\n error : \(error!)")
    }
    
    func rewardedAdDidFailToShow(forAdUnitID adUnitID: String!, error: Error!) {
        print("rewardedAdDidFailToShow : \(adUnitID!)\n error : \(error!)")
    }
    
    func rewardedAdShouldReward(forAdUnitID adUnitID: String!, reward: MPReward!) {
        print("rewardedAdShouldReward : \(adUnitID!)\n reward : \(reward.currencyType!)")
    }
    
    // MARK: -
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
