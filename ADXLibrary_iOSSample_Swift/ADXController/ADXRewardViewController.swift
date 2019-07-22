//
//  ADXRewardViewController.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 4. 6..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import MoPub

class ADXRewardViewController: UIViewController, MPRewardedVideoDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MPRewardedVideo.setDelegate(self, forAdUnitId: REWARDEDVIDEO_AD_UNIT_ID)
        MPRewardedVideo.loadAd(withAdUnitID: REWARDEDVIDEO_AD_UNIT_ID, withMediationSettings: nil)
    }
    
    @IBAction func selectShowAd(_ sender: Any) {
        if (MPRewardedVideo.hasAdAvailable(forAdUnitID: REWARDEDVIDEO_AD_UNIT_ID) == true) {
            MPRewardedVideo.presentAd(forAdUnitID: REWARDEDVIDEO_AD_UNIT_ID, from: self, with: nil)
        } else {
            MPRewardedVideo.loadAd(withAdUnitID: REWARDEDVIDEO_AD_UNIT_ID, withMediationSettings: nil)
        }
    }
    
    // MARK: - MPRewardedVideoDelegate
    
    func rewardedVideoAdDidLoad(forAdUnitID adUnitID: String!) {
        print("rewardedVideoAdDidLoad :", adUnitID!)
    }
    
    func rewardedVideoAdDidAppear(forAdUnitID adUnitID: String!) {
        print("rewardedVideoAdDidAppear :", adUnitID!)
    }

    func rewardedVideoAdDidExpire(forAdUnitID adUnitID: String!) {
        print("rewardedVideoAdDidExpire :", adUnitID!)
    }
    
    func rewardedVideoAdWillAppear(forAdUnitID adUnitID: String!) {
        print("rewardedVideoAdWillAppear :", adUnitID!)
    }
    
    func rewardedVideoAdDidDisappear(forAdUnitID adUnitID: String!) {
        print("rewardedVideoAdDidDisappear :", adUnitID!)
    }
    
    func rewardedVideoAdWillDisappear(forAdUnitID adUnitID: String!) {
        print("rewardedVideoAdWillDisappear :", adUnitID!)
    }
    
    func rewardedVideoAdDidReceiveTapEvent(forAdUnitID adUnitID: String!) {
        print("rewardedVideoAdDidReceiveTapEvent :", adUnitID!)
    }
    
    func rewardedVideoAdWillLeaveApplication(forAdUnitID adUnitID: String!) {
        print("rewardedVideoAdWillLeaveApplication :", adUnitID!)
    }
    
    func rewardedVideoAdDidFailToLoad(forAdUnitID adUnitID: String!, error: Error!) {
        print("rewardedVideoAdDidFailToLoad :", adUnitID!)
        print("error :", error!)
    }
    
    func rewardedVideoAdDidFailToPlay(forAdUnitID adUnitID: String!, error: Error!) {
        print("rewardedVideoAdDidFailToPlay :", adUnitID!)
        print("error :", error!)
    }
    
    func rewardedVideoAdShouldReward(forAdUnitID adUnitID: String!, reward: MPRewardedVideoReward!) {
        print("rewardedVideoAdShouldReward :", adUnitID!)
        print("reward :", reward.currencyType!)
    }
    
    // MARK: -
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
