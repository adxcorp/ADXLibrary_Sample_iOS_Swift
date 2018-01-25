//
//  ADXFullScreenViewController.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 1. 24..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import MoPub

var INTERSTITIAL_AD_UNIT_ID = "7758ce2f590f43fd8ba9f03d14fc8b78"

class ADXFullScreenViewController: UIViewController, MPInterstitialAdControllerDelegate {

    fileprivate var mopubInterstitial: MPInterstitialAdController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInterstitial()
    }
    
    @IBAction func selectShowAd(_ sender: Any) {
        showInterstitial()
    }
    
    func loadInterstitial() {

        mopubInterstitial = MPInterstitialAdController(forAdUnitId: INTERSTITIAL_AD_UNIT_ID)
        mopubInterstitial.delegate = self
        mopubInterstitial.loadAd()
    }
    
    func showInterstitial() {

        if(mopubInterstitial.ready) {
            mopubInterstitial.show(from: self);
        }
    }
    
    func interstitialDidLoadAd(_ interstitial: MPInterstitialAdController!) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
