//
//  InformationUserViewController.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 7/6/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

class InformationUserViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var generalContainerView: UIView!
  @IBOutlet weak var detailContainerView: UIView!
  @IBOutlet weak var userImageView: UIImageView!
  
  // MARK: -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpContainerView()
    setUpElements()
  }
  
  func setUpContainerView() {
    generalContainerView.corner()
    generalContainerView.shadow()
    generalContainerView.border()
    
    detailContainerView.corner()
    detailContainerView.shadow()
    detailContainerView.border()
  }
  
  func setUpElements() {
    userImageView.corner(radius: userImageView.frame.width/2)
    userImageView.border()
    userImageView.shadow()
    userImageView.layer.masksToBounds = true
    
  }
}
