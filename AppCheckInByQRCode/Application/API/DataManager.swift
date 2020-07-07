//
//  DataManager.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 7/2/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

enum DataManagerError: Error {
  case Unknown
  case FailedRequest
  case InvalidResponse
}

class DataManager {
  
  typealias DataCompletion = (User?, DataManagerError?) -> ()
  
  let baseURL: URL
  
  init(baseURL: URL) {
    self.baseURL = baseURL
  }
  
  func login(email: String, password: String, completion: @escaping DataCompletion) {
    //MARK: - Initialize URL
    let url = URL(string: "\(baseURL)login?email=\(email)&password=\(password)")
    guard let safeURL = url else { return }
    var request = URLRequest(url: safeURL)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
      if let _ = error {
        completion(nil, .FailedRequest)
      }
      else if let data = data, let response = response as? HTTPURLResponse {
        if response.statusCode == 200 {
//          print(data)
//          if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//              // try to read out a string array
//              print(json)
//          }
          do {
            let decoder = JSONDecoder()
            
            let user = try decoder.decode(User.self, from: data)
            completion(user, nil)
          } catch {
            completion(nil, .InvalidResponse)
          }
        }
        else {
          completion(nil, .InvalidResponse)
        }
      }
      else {
        completion(nil, .Unknown)
      }
    }
    dataTask.resume()
  }
  
  
}
