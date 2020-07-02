////
////  DataManager.swift
////  AppCheckInByQRCode
////
////  Created by Hoang Trong Kien on 7/2/20.
////  Copyright © 2020 Hoang Trong Kien. All rights reserved.
////
//
//import UIKit
//
//enum DataManagerError: Error {
//  case Unknown
//  case FailedRequest
//  case InvalidResponse
//}
//
//class DataManager {
//  
//  typealias DataCompletion = (AnyObject?, DataManagerError?) -> ()
//  
//  let baseURL: URL
//  
//  init(baseURL: URL) {
//    self.baseURL = baseURL
//  }
//  
//  // MARK: - Request API
//  func makeRequest(completion: @escaping DataCompletion) {
//    
//    // MARK: - Initialize URL
//    let url = URL(string: "\(baseURL)")
//    guard let safeURL = url else { return }
//    
//    // MARK: - Request URL
//    URLSession.shared.dataTask(with: safeURL) {
//      (data, response, error) in
//      if let _ = error {
//        completion(nil, .FailedRequest)
//      }
//      else if let data = data, let response = response as? HTTPURLResponse {
//        if response.statusCode == 200 {
//          print("200")
//        }
//        else {
//          completion(nil, .InvalidResponse)
//        }
//      }
//      else {
//        completion(nil, .Unknown)
//      }
//    }.resume()
//  }
//}
