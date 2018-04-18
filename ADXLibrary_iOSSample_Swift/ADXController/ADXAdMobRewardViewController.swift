//
//  ADXAdMobRewardViewController.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 4. 18..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import GoogleMobileAds
import VungleAdapter

class ADXAdMobRewardViewController: UIViewController, GADRewardBasedVideoAdDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GADRewardBasedVideoAd.sharedInstance().delegate = self
    }
    @IBAction func selectShowAd(_ sender: Any) {
        
        if(GADRewardBasedVideoAd.sharedInstance().isReady) {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        } else {
            let request = GADRequest()
            let extras = VungleAdNetworkExtras.init()
            let placements = NSArray.init(objects: "DEFAULT-4197699", "SAMPLE_IOS_REWARDED_VIDEO-2228390")
            
            let placementsArray = placements as NSArray as! [String]
            extras.allPlacements = placementsArray
            
            request.register(extras)
            request.testDevices = ["e527e0336ebd9354411d932aa50910ca"]
            
            GADRewardBasedVideoAd.sharedInstance().load(request, withAdUnitID: "ca-app-pub-7466439784264697/6572954274")
        }
    }
    
    // MARK: - GADRewardBasedVideoAdDelegate
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidOpen")
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidClose")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidReceive")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidStartPlaying")
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdWillLeaveApplication")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didFailToLoadWithError error: Error) {
        print("rewardBasedVideoAd")
        print("error :", error)
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        print("rewardBasedVideoAd")
    }

    // MARK: -
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
