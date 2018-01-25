//
//  ADXNativeAdPlacerViewController.swift
//  ADXLibrary_iOSSample_Swift
//
//  Created by Eleanor Choi on 2018. 1. 24..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

import UIKit
import ADXLibrary

class ADXNativeAdPlacerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var mainCollectionView: UICollectionView!
    var placer : MPCollectionViewAdPlacer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.placer = NativeAdFactory.sharedInstance().getCollectionViewAdPlacer(NATIVE_AD_UNIT_ID
            , collectionView: self.mainCollectionView
            , viewController: self
            , viewSizeHandler: { (maximumWidth) -> CGSize in
                let width : CGFloat
                width = UIScreen.main.bounds.size.width;
                return CGSize(width: width, height: floor(width * 0.5225))
        })
        
        self.placer.loadAds(forAdUnitID: NATIVE_AD_UNIT_ID)
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
