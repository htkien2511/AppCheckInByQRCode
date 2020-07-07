//
//  ViewAllEventsViewController.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 7/6/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

class ViewAllEventsViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var viewAllEventsCollectionView: UICollectionView!
  @IBOutlet weak var headerLabel: UILabel!
  
  // MARK: - Properties
  var headerName = ""
  let cellIdentifier = "eventsCell"
  var data: [String] = ["1", "2", "3", "4", "5"]
  let edgeInset: CGFloat = 16
  
  // MARK: -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    headerLabel.text = headerName
    
    setUpCollectionView()
  }
  
  func setUpCollectionView() {
    viewAllEventsCollectionView.register(UINib(nibName: "ViewAllEventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    
    viewAllEventsCollectionView.dataSource = self
    viewAllEventsCollectionView.delegate = self
    viewAllEventsCollectionView.showsHorizontalScrollIndicator = false
  }
  
  @IBAction func backButtonTapped(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
}

// MARK: - Collection View Data Source
extension ViewAllEventsViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                  for: indexPath) as! ViewAllEventsCollectionViewCell
    cell.imageViewCell.layer.cornerRadius = CGFloat(20)
    cell.shadow()
    cell.layer.shadowOffset = CGSize(width: 0, height: 0)
    cell.layer.masksToBounds = false
    return cell
    
  }
  
}

// MARK: - Collection View Delegate Flow Layout
extension ViewAllEventsViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let itemsPerRow: CGFloat = 1
    let padding: CGFloat = 16
    let collectionViewWidth: CGFloat = collectionView.frame.width - (padding * (itemsPerRow - 1)) - (edgeInset * 2)
    let widthPerItem: CGFloat = collectionViewWidth / itemsPerRow
    let heightPerItem: CGFloat = 200
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
