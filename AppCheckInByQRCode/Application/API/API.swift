//
//  API.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 7/2/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

struct API {
  static let BaseURL = URL(string: "https://events.sdc.click/api/login?email=admin@gmail.com&password=123123")!
  static let APIKey = "0e0877237e3aa921319e1e984c87f89d"
  
  static var AuthenticatedBaseURL: URL {
    return URL(string: "\(BaseURL)")!
  }
}
