//
//  API.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 7/2/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

struct API {
  static let BaseURL = URL(string: "http://events.sdc.click/api/")!
  
  static var AuthenticatedBaseURL: URL {
    return URL(string: "\(BaseURL)")!
  }
}
