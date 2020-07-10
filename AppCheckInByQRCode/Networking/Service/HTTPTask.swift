//
//  HTTPTask.swift
//  NetworkLayerDemo
//
//  Created by Hoang Trong Kien on 7/8/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
  case request
  
  case requestParameters(bodyParameters: Parameters?,
    bodyEncoding: ParameterEncoding,
    urlParameters: Parameters?)
  
  case requestParametersAndHeaders(bodyParameters: Parameters?,
    bodyEncoding: ParameterEncoding,
    urlParameters: Parameters?,
    additionHeaders: HTTPHeaders?)
  
  // case download, upload...etc
}
