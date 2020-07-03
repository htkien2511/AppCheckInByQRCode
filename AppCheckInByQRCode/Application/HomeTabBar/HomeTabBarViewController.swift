//
//  HomeTabBarViewController.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 7/3/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

class HomeTabBarViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var presentEventCollectionView: UICollectionView!
  @IBOutlet weak var latestEventCollectionView: UICollectionView!
  
  // MARK: - Properties
  let cellIdentifier = "presentEventsCell"
  let edgeInset: CGFloat = 16
  let objects = ["Cat", "Dog", "Fish","Cat", "Fish","Cat", "Fish","Cat"]
  // MARK: -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpCollectionView()
  }
  
  func setUpCollectionView() {
    presentEventCollectionView.register(UINib(nibName: "PresentEventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    
    presentEventCollectionView.dataSource = self
    presentEventCollectionView.delegate = self
    presentEventCollectionView.showsHorizontalScrollIndicator = false
    
    latestEventCollectionView.register(UINib(nibName: "LatestEventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    
    latestEventCollectionView.dataSource = self
    latestEventCollectionView.delegate = self
    latestEventCollectionView.showsVerticalScrollIndicator = false
  }
}

// MARK: - Collection View Data Source
extension HomeTabBarViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.objects.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == presentEventCollectionView {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
      for: indexPath) as! PresentEventsCollectionViewCell
      cell.imageViewCell.layer.cornerRadius = CGFloat(20)
      cell.shadow()
      cell.layer.shadowOffset = CGSize(width: 0, height: 0)
      cell.layer.masksToBounds = false
      return cell
    }
    // latestEventCollectionView
    else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
      for: indexPath) as! LatestEventsCollectionViewCell
      
      return cell
    }
  }
  
}

// MARK: - Collection View Delegate Flow Layout
extension HomeTabBarViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == presentEventCollectionView {
      let itemsPerCol: CGFloat = 1
      let padding: CGFloat = 16
      let collectionViewHeight: CGFloat = collectionView.frame.height - (padding * (itemsPerCol - 1)) - (edgeInset * 2)
      let heightPerItem: CGFloat = collectionViewHeight / itemsPerCol
      let widthPerItem: CGFloat = collectionView.frame.width * 0.8
      return CGSize(width: widthPerItem, height: heightPerItem)
    }
    else {
      let itemsPerRow: CGFloat = 1
      let padding: CGFloat = 10
      let collectionViewWidth: CGFloat = collectionView.frame.width - (padding * (itemsPerRow - 1)) - (edgeInset * 2)
      let widthPerItem: CGFloat = collectionViewWidth / itemsPerRow
      let heightPerItem: CGFloat = widthPerItem/2 > 160 ? widthPerItem/2 : 160
      return CGSize(width: widthPerItem, height: heightPerItem)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return CGFloat(10)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    if collectionView == presentEventCollectionView {
      return UIEdgeInsets(top: 0, left: edgeInset, bottom: 0, right: edgeInset)
    }
    else {
      return UIEdgeInsets(top: edgeInset, left: edgeInset, bottom: edgeInset, right: edgeInset)
    }
  }
}
