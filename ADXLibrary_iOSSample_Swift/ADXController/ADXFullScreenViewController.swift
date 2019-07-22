//
//  ADXFullScreenViewController.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 1. 24..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import MoPub

class ADXFullScreenViewController: UIViewController, MPInterstitialAdControllerDelegate {

    fileprivate var mopubInterstitial: MPInterstitialAdController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mopubInterstitial = MPInterstitialAdController(forAdUnitId: INTERSTITIAL_AD_UNIT_ID)
        mopubInterstitial.delegate = self
    }
    
    @IBAction func selectShowAd(_ sender: Any) {
        mopubInterstitial.loadAd()
    }
    
    // MARK: - MPInterstitialAdControllerDelegate
    
    func interstitialDidLoadAd(_ interstitial: MPInterstitialAdController!) {
        print("interstitialDidLoadAd")
        mopubInterstitial.show(from: self);
    }
    
    func interstitialDidFail(toLoadAd interstitial: MPInterstitialAdController!) {
        print("interstitialDidFail")
    }
    
    // MARK: -
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
