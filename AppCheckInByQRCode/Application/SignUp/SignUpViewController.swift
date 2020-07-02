//
//  SignUpViewController.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 6/26/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var containerSignUpView: UIView!
  @IBOutlet var formartedLabel: Array<UILabel>!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet var inputTextField: Array<UITextField>!
  
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
      if inputTextField[0].isFirstResponder || inputTextField[1].isFirstResponder {
        
      }
      else if self.view.frame.origin.y == 0 {
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
    for i in 0..<inputTextField.count {
      inputTextField[i].delegate = self
    }
  }
  
  func setUpImageViewInsideTextField() {
    changeImageView(textField: inputTextField[0], nameImage: "user")
    changeImageView(textField: inputTextField[1], nameImage: "phone")
    changeImageView(textField: inputTextField[2], nameImage: "location")
    changeImageView(textField: inputTextField[3], nameImage: "email")
    changeImageView(textField: inputTextField[4], nameImage: "password")
    changeImageView(textField: inputTextField[5], nameImage: "password")
  }
  
  func changeImageView(textField: UITextField, nameImage: String) {
    if let myImage = UIImage(named: nameImage){
        textField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.blue, colorBorder: UIColor.black)
    }
  }
  
  func setUpElements() {
    containerSignUpView.shadow()
    containerSignUpView.corner(radius: 15)
    
    signUpButton.shadow()
    signUpButton.corner()
    signUpButton.titleLabel?.shadow()
    
    for i in 0..<formartedLabel.count {
      formartedLabel[i].shadow(color: UIColor.black.cgColor, opacity: 0.1, radius: 5)
    }
  }
  
  // MARK: - Action
  @IBAction func signUpButtonTapped(_ sender: UIButton) {
    print("sign up button tapped")
  }
  
}

// MARK: - Text Field Delegate
extension SignUpViewController: UITextFieldDelegate {
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
