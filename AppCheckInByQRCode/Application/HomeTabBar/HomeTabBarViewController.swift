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
  @IBOutlet weak var upcomingEventCollectionView: UICollectionView!
  @IBOutlet weak var latestEventCollectionView: UICollectionView!
  @IBOutlet weak var completedEventCollectionView: UICollectionView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  // MARK: - Properties
  let cellIdentifier = "presentEventsCell"
  let edgeInset: CGFloat = 16
  let upcomingEventData = ["Cat", "Dog", "Fish"]
  let latestEventData = ["Cat", "Dog", "FishCat", "Dog", "Fish"]
  let completedEventData = ["Cat", "Dog", "FishCat", "Dog", "FishCat", "Dog", "Fish"]
  // MARK: -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    searchBar.delegate = self
    searchBar.layer.borderWidth = CGFloat(1)
    setUpCollectionView()
  }
  
  func setUpCollectionView() {
    upcomingEventCollectionView.register(UINib(nibName: "UpcomingEventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    
    upcomingEventCollectionView.dataSource = self
    upcomingEventCollectionView.delegate = self
    upcomingEventCollectionView.showsHorizontalScrollIndicator = false
    
    latestEventCollectionView.register(UINib(nibName: "LatestEventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    
    latestEventCollectionView.dataSource = self
    latestEventCollectionView.delegate = self
    latestEventCollectionView.showsVerticalScrollIndicator = false
    
    completedEventCollectionView.register(UINib(nibName: "LatestEventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    
    completedEventCollectionView.dataSource = self
    completedEventCollectionView.delegate = self
    completedEventCollectionView.showsVerticalScrollIndicator = false
  }
  
  // MARK: - Action
  
}

// MARK: - Collection View Data Source
extension HomeTabBarViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == upcomingEventCollectionView {
      return self.upcomingEventData.count
    }
    else if collectionView == latestEventCollectionView {
      return self.latestEventData.count
    }
    else {
      return self.completedEventData.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == upcomingEventCollectionView {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                    for: indexPath) as! UpcomingEventsCollectionViewCell
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
      cell.imageViewCell.layer.cornerRadius = CGFloat(20)
      cell.shadow()
      cell.layer.shadowOffset = CGSize(width: 0, height: 0)
      cell.layer.masksToBounds = false
      return cell
    }
  }
  
}

// MARK: - Collection View Delegate Flow Layout
extension HomeTabBarViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    //    if collectionView == upcomingEventCollectionView {
    //      let itemsPerCol: CGFloat = 1
    //      let padding: CGFloat = 16
    //      let collectionViewHeight: CGFloat = collectionView.frame.height - (padding * (itemsPerCol - 1)) - (edgeInset * 2)
    //      let heightPerItem: CGFloat = collectionViewHeight / itemsPerCol
    //      let widthPerItem: CGFloat = collectionView.frame.width * 0.8
    //      return CGSize(width: widthPerItem, height: heightPerItem)
    //    }
    //    else {
    let itemsPerCol: CGFloat = 1
    let padding: CGFloat = 16
    let collectionViewHeight: CGFloat = collectionView.frame.height - (padding * (itemsPerCol - 1)) - (edgeInset * 2)
    let heightPerItem: CGFloat = collectionViewHeight / itemsPerCol
    let widthPerItem: CGFloat = collectionView.frame.width * 0.8
    return CGSize(width: widthPerItem, height: heightPerItem)
    //}
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return CGFloat(10)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    if collectionView == upcomingEventCollectionView {
      return UIEdgeInsets(top: 0, left: edgeInset, bottom: 0, right: edgeInset)
    }
    else {
      return UIEdgeInsets(top: edgeInset, left: edgeInset, bottom: edgeInset, right: edgeInset)
    }
  }
}

extension HomeTabBarViewController: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    let storyBoard : UIStoryboard = UIStoryboard(name: "SearchEvent", bundle:nil)

    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "searchEventView") as! SearchBarViewController
    nextViewController.modalPresentationStyle = .fullScreen
    self.present(nextViewController, animated:true, completion:nil)
  }
}
