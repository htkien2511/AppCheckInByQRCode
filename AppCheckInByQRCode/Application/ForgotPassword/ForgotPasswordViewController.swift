//
//  ForgotPasswordViewController.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 6/26/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var containerForgotPasswordView: UIView!
  @IBOutlet weak var forgotPasswordLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var sendCodeButton: UIButton!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  // MARK: -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpElements()
    setUpImageViewInsideTextField()
    setUpTextFieldDelegate()
    setUpViewWhenKeyboardAppear()
  }
  
  func setUpViewWhenKeyboardAppear() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                           name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                           name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc func keyboardWillShow(notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
      if self.view.frame.origin.y == 0 {
        self.view.frame.origin.y -= keyboardSize.height
      }
    }
    
    //
    let viewIsTap = UITapGestureRecognizer(target: self, action: #selector(viewIsTapped))
    view.addGestureRecognizer(viewIsTap)
  }
  
  @objc func keyboardWillHide(notification: NSNotification) {
    if self.view.frame.origin.y != 0 {
      self.view.frame.origin.y = 0
    }
    
    //
    view.gestureRecognizers?.removeAll(where: { (gestureRecognizer) -> Bool in
      return gestureRecognizer is UITapGestureRecognizer
    })
  }
  
  @objc func viewIsTapped() {
    view.endEditing(true)
  }
  
  func setUpTextFieldDelegate() {
    emailTextField.delegate = self
  }
  
  func setUpImageViewInsideTextField() {
    changeImageView(textField: emailTextField, nameImage: "email")
  }
  
  func changeImageView(textField: UITextField, nameImage: String) {
    if let myImage = UIImage(named: nameImage){
        textField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.blue, colorBorder: UIColor.black)
    }
  }
  
  func setUpElements() {
    containerForgotPasswordView.shadow()
    containerForgotPasswordView.corner(radius: 15)
    
    sendCodeButton.shadow()
    sendCodeButton.corner()
    sendCodeButton.titleLabel?.shadow()
    
    forgotPasswordLabel.shadow(color: UIColor.black.cgColor, opacity: 0.4, radius: 5)
    emailLabel.shadow(color: UIColor.black.cgColor, opacity: 0.3, radius: 5)
  }
  
  @IBAction func loginButtonTapped(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
}

// MARK: - Text Field Delegate
extension ForgotPasswordViewController: UITextFieldDelegate {
  // move into password textfield
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    let nextTag = textField.tag + 1
    
    if let nextResponder = textField.superview?.viewWithTag(nextTag) {
      nextResponder.becomeFirstResponder()
    } else {
      textField.resignFirstResponder()
      print("Pass data to database")
    }
    return true
  }
}
