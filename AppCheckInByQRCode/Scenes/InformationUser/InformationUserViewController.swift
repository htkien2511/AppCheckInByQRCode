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
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  
  // MARK: -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpData()
    setUpContainerView()
    setUpElements()
  }
  
  func setUpData() {
    let user = SingletonUser.sharedManager.user!
    nameLabel.text = user.user.name
    emailLabel.text = user.user.email
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
  
  // MARK: - Action
  @IBAction func logoutButtonTapped(_ sender: UIButton) {
    LoadingDialog.showLoadingDialog(self)
    let networkManager = NetworkManager()
    let accessToken = SingletonUser.sharedManager.user!.accessToken
    networkManager.logout(accessToken: accessToken) { (message, error) in
      if error != nil {
        print(error!)
      }
      else {
        DispatchQueue.main.async {
          // dissmiss loading dialog
          self.dismiss(animated: true) {
            self.goToLoginScreen()
          }
        }
      }
    }
  }
  
  private func goToLoginScreen() {
    let storyBoard : UIStoryboard = UIStoryboard(name: "Login", bundle:nil)
    
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "loginScreen") as! LoginViewController
    nextViewController.modalPresentationStyle = .fullScreen
    nextViewController.modalTransitionStyle = .crossDissolve
    self.present(nextViewController, animated:true, completion:nil)
  }
}
