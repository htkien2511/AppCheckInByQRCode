//
//  HomeTabBarController.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 7/2/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

class HomeTabBarController: UIViewController {
  // MARK: - Outlets
  @IBOutlet weak var eventSegmentedControl: UISegmentedControl!
  @IBOutlet weak var presentEventCollectionView: UICollectionView!
  
  // MARK: - Properties
  let cellIdentifier = "presentEventsCell"
  let edgeInset: CGFloat = 10
  let objects = ["Cat", "Dog", "Fish","Cat"]
  // MARK: -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpSegmentedControl()
    setUpCollectionView()
  }
  
  func setUpCollectionView() {
    presentEventCollectionView.register(UINib(nibName: "PresentEventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    
    presentEventCollectionView.dataSource = self
    presentEventCollectionView.delegate = self
    presentEventCollectionView.showsVerticalScrollIndicator = false
  }
  
  func setUpSegmentedControl() {
    
  }
  
  // MARK: - Action
  @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
    print(sender.selectedSegmentIndex)
    
  }
  
  
}

// MARK: - Collection View Data Source
extension HomeTabBarController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.objects.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                  for: indexPath) as! PresentEventsCollectionViewCell
    
    cell.containerViewCell.corner()
    cell.shadow()
    cell.layer.shadowOffset = CGSize(width: 0, height: 0)
    cell.layer.masksToBounds = false
    cell.eventImageView.layer.cornerRadius = cell.eventImageView.frame.width / 2
    cell.eventImageView.layer.borderWidth = CGFloat(2)
    cell.eventImageView.layer.borderColor = UIColor.white.cgColor
    return cell
  }
  
}

// MARK: - Collection View Delegate Flow Layout
extension HomeTabBarController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemsPerRow: CGFloat = 1
    let padding: CGFloat = 10
    let collectionViewWidth: CGFloat = collectionView.frame.width - (padding * (itemsPerRow - 1)) - (edgeInset * 2)
    let widthPerItem: CGFloat = collectionViewWidth / itemsPerRow
    let heightPerItem: CGFloat = widthPerItem/2 > 160 ? widthPerItem/2 : 160
    return CGSize(width: widthPerItem, height: heightPerItem)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return CGFloat(10)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: edgeInset, left: edgeInset, bottom: edgeInset, right: edgeInset)
  }
}
