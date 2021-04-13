//
//  ADXBannerViewController.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 1. 24..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import MoPubSDK

class ADXBannerViewController: UIViewController, MPAdViewDelegate {
    fileprivate var adView : MPAdView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adView = MPAdView(adUnitId: BANNER_AD_UNIT_ID)
        adView.delegate = self
        
        let bannerSize = CGSize(width: UIScreen.main.bounds.size.width, height: kMPPresetMaxAdSize50Height.height)
        adView.frame = CGRect(x: (UIScreen.main.bounds.size.width - bannerSize.width) / 2,
                              y: UIScreen.main.bounds.size.height - bannerSize.height,
                              width: bannerSize.width,
                              height: bannerSize.height)
        view.addSubview(adView)
        adView.loadAd()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        let bannerSize = adView.adContentViewSize()
        let centeredX = (size.width - bannerSize.width) / 2
        let bottomAlignedY = size.height - bannerSize.height
        
        adView.frame = CGRect(x: centeredX, y: bottomAlignedY, width: bannerSize.width, height: bannerSize.height)
    }
    
    // MARK: - MPAdViewDelegate
    
    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }
    
    func adViewDidLoadAd(_ view: MPAdView!, adSize: CGSize) {
        print("adViewDidLoadAd : \(adSize)")
    }
    
    func adView(_ view: MPAdView!, didFailToLoadAdWithError error: Error!) {
        print("adViewDidFail")
    }

}
