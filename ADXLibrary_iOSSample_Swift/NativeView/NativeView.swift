//
//  NativeAdView.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 1. 24..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import MoPubSDK

class NativeAdView: UIView, MPNativeAdRendering {

    @IBOutlet var contentsView: UIView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var mainTextLabel: UILabel!
    @IBOutlet var callToActionLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var privacyInformationIconImageView: UIImageView!
    @IBOutlet var mainImageView: UIImageView!
    
    convenience init() {
        self.init(frame: .zero)
        initView()

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    func initView() {
        Bundle.main.loadNibNamed("NativeAdView", owner: self, options: nil)
        addSubview(contentsView)
        
        contentsView.frame = self.bounds
        contentsView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override func layoutSubviews () {
        super.layoutSubviews()
    }

    func nativeMainTextLabel() -> UILabel {
        return self.mainTextLabel
    }
    
    func nativeTitleTextLabel() -> UILabel {
        return self.titleLabel
    }
    
    func nativeCallToActionTextLabel() -> UILabel {
        return self.callToActionLabel
    }
    
    func nativeIconImageView() -> UIImageView {
        return self.iconImageView
    }
    
    func nativeMainImageView() -> UIImageView {
        return self.mainImageView
    }
    
    func nativePrivacyInformationIconImageView() -> UIImageView {
        return self.privacyInformationIconImageView
    }
}

