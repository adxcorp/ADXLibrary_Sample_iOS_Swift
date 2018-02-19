//
//  ADXBannerViewController.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 1. 24..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import MoPub

var BANNER_AD_UNIT_ID = "a9bcfae03030442da3ed277aff98713c"

class ADXBannerViewController: UIViewController, MPAdViewDelegate {
    fileprivate var mopubAdView : MPAdView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupADBanner()
    }
    
    func setupADBanner() {
        
        mopubAdView = MPAdView(adUnitId: BANNER_AD_UNIT_ID, size: MOPUB_BANNER_SIZE)
        mopubAdView.delegate = self
        var frame = mopubAdView.frame
        let size = mopubAdView.adContentViewSize()
        
        frame.origin = CGPoint(x: (UIScreen.main.bounds.width - size.width)/2,
                               y: UIScreen.main.bounds.height - size.height)
        mopubAdView.frame = frame
        mopubAdView.loadAd()
        
        self.view.addSubview(mopubAdView)
        
    }
    
    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }
    
    func adViewDidLoadAd(_ view: MPAdView!) {
        print(view.description)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
