//
//  SingletonUser.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 7/6/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

class SingletonUser {
  static let sharedManager = SingletonUser()
  
  var user: User?
  
  private init() {}
}
