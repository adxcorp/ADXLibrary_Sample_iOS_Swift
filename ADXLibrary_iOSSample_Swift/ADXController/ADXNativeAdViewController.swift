//
//  ADXNativeAdViewController.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 1. 24..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import MoPub
import ADXLibrary

let NATIVE_AD_UNIT_ID = "9ab55b93573b43869da0c47bd0780cd1"

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }

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
            
        }

    
    }
    
    func onFailure(_ adUnitId: String!) {
        
    }

}
