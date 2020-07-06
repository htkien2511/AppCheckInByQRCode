//
//  Validation.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 7/6/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

class Validation {
  static func isValid(email: String) -> Bool {
      let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"

      
      let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
      return emailTest.evaluate(with: email)
  }
}
