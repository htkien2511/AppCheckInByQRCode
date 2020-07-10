//
//  EndPointType.swift
//  NetworkLayerDemo
//
//  Created by Hoang Trong Kien on 7/8/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

protocol EndPointType {
  var baseURL: URL { get }
  var path: String { get }
  var httpMethod: HTTPMethod { get }
  var task: HTTPTask { get }
  var headers: HTTPHeaders? { get }
}
