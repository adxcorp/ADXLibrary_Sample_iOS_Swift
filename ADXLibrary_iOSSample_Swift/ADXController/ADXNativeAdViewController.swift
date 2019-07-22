//
//  ADXNativeAdViewController.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 1. 24..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import MoPub

class ADXNativeAdViewController: UIViewController, NativeAdFactoryDelegate, MPNativeAdDelegate {

    var nativeAd:MPNativeAd?
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NativeAdFactory.sharedInstance().remove(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NativeAdFactory.sharedInstance().add(self)
        NativeAdFactory.sharedInstance().loadAd(NATIVE_AD_UNIT_ID)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - MPNativeAdDelegate
    
    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }

    // MARK: - NativeAdFactoryDelegate
    
    func onSuccess(_ adUnitId: String!, nativeAd: MPNativeAd!) {
        
        if (adUnitId == NATIVE_AD_UNIT_ID) {
            
            self.nativeAd = nativeAd
            self.nativeAd?.delegate = self

            let nativeAdView = NativeAdFactory.sharedInstance().getNativeAdView(NATIVE_AD_UNIT_ID)
            nativeAdView?.frame = CGRect(x: (UIScreen.main.bounds.width - 300.0)/2
                , y: 100.0
                , width: 300.0
                , height: 200.0)
            self.view.addSubview(nativeAdView!)
            
        } else {
            print("fail to load")
        }

    
    }
    
    func onFailure(_ adUnitId: String!) {
        print("onFailure :", adUnitId!)
    }
    
    // MARK: -
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
