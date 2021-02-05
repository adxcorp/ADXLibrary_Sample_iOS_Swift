//
//  ADXAdMobRewardViewController.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 4. 18..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ADXAdMobRewardViewController: UIViewController, GADRewardedAdDelegate {
    
    var rewardedAd: GADRewardedAd?
    
    var REWARDEDVIDEO_AD_UNIT_ID = "ca-app-pub-7466439784264697/6572954274"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "e20af00f58944a24199be16334aa148f" ];
        
        createAndLoadRewardedAd()
    }
    
    func createAndLoadRewardedAd() {
      rewardedAd = GADRewardedAd(adUnitID: REWARDEDVIDEO_AD_UNIT_ID)
      rewardedAd?.load(GADRequest()) { error in
        if let error = error {
          print("Loading failed: \(error)")
        } else {
          print("Loading Succeeded")
        }
      }
    }
    
    @IBAction func selectShowAd(_ sender: Any) {
        
        if rewardedAd?.isReady == true {
             rewardedAd?.present(fromRootViewController: self, delegate:self)
        } else {
            createAndLoadRewardedAd()
        }
    }
    
    // MARK: - GADRewardedAdDelegate
    
    /// Tells the delegate that the user earned a reward.
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
      print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
    /// Tells the delegate that the rewarded ad was presented.
    func rewardedAdDidPresent(_ rewardedAd: GADRewardedAd) {
      print("Rewarded ad presented.")
    }
    /// Tells the delegate that the rewarded ad was dismissed.
    func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
      print("Rewarded ad dismissed.")
        
        createAndLoadRewardedAd()
    }
    /// Tells the delegate that the rewarded ad failed to present.
    func rewardedAd(_ rewardedAd: GADRewardedAd, didFailToPresentWithError error: Error) {
      print("Rewarded ad failed to present.")
    }

    // MARK: -
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
