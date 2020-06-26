//
//  ViewController.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 6/26/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - Outlets
  @IBOutlet weak var containerLoginView: UIView!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var loginLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var passwordLabel: UILabel!
  @IBOutlet weak var errorLabel: UILabel!
  
  // MARK: -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpElements()
  }

  func setUpElements() {    
    containerLoginView.shadow()
    containerLoginView.corner(radius: 15)
    
    loginButton.shadow()
    loginButton.corner()
    
    loginLabel.shadow(color: UIColor.black.cgColor, opacity: 0.1, radius: 5)
    emailLabel.shadow(color: UIColor.black.cgColor, opacity: 0.1, radius: 1)
    passwordLabel.shadow(color: UIColor.black.cgColor, opacity: 0.1, radius: 1)
    loginButton.titleLabel?.shadow()
  }
}

