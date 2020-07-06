//
//  ViewController.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 6/26/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var containerLoginView: UIView!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var loginLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var passwordLabel: UILabel!
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  // MARK: -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    emailTextField.delegate = self
    passwordTextField.delegate = self
    setUpElements()
    setUpViewWhenKeyboardAppear()
    setUpImageViewInsideTextField()
  }
  
  func setUpImageViewInsideTextField() {
    changeImageView(textField: emailTextField, nameImage: "email")
    changeImageView(textField: passwordTextField, nameImage: "password")
  }
  
  func changeImageView(textField: UITextField, nameImage: String) {
    if let myImage = UIImage(named: nameImage){
        textField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.blue, colorBorder: UIColor.black)
    }
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

// MARK: - Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
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
