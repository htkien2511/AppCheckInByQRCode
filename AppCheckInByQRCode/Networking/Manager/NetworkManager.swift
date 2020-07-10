//
//  NetworkManager.swift
//  NetworkLayerDemo
//
//  Created by Hoang Trong Kien on 7/8/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

enum NetworkResponse:String {
  case success
  case authenticationError = "You need to be authenticated first."
  case badRequest = "Bad request"
  case outdated = "The url you requested is outdated."
  case failed = "Network request failed."
  case noData = "Response returned with no data to decode."
  case unableToDecode = "We could not decode the response."
}

enum Result<String>{
  case success
  case failure(String)
}

struct NetworkManager {
  static let environment : NetworkEnvironment = .login
  static let MovieAPIKey = ""
  let router = Router<EventApi>()
  
  func request(eventAPI: EventApi, completion: @escaping (Data? , _ error: String?)->()) {
    router.request(eventAPI) { (data, response, error) in
      if error != nil {
        completion(nil, "Please check your network connection.")
      }
      
      if let response = response as? HTTPURLResponse {
        let result = self.handleNetworkResponse(response)
        switch result {
        case .success:
          guard let responseData = data else {
            completion(nil, NetworkResponse.noData.rawValue)
            return
          }
          do {
            let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
            print(jsonData)
            completion(responseData, nil)
          }catch {
            print(error)
            completion(nil, NetworkResponse.unableToDecode.rawValue)
          }
        case .failure(let networkFailureError):
          completion(nil, networkFailureError)
        }
      }
    }
  }
  
  // MARK: - Login
  func login(email: String, password: String, completion: @escaping (User? ,_ error: String?)->()){
    request(eventAPI: .login(email: email, password: password)) { (responseData, error) in
      if error != nil {
        print(error!)
      } else {
        do {
          let apiResponse = try JSONDecoder().decode(User.self, from: responseData!)
          completion(apiResponse, nil)
        }catch {
          print(error)
          completion(nil, NetworkResponse.unableToDecode.rawValue)
        }
      }
    }
  }
  
  // MARK: - Log out
  func logout(accessToken: String, completion: @escaping (AnyObject? ,_ error: String?)->()) {
    request(eventAPI: .logout(accessToken: accessToken)) { (responseData, error) in
      if error != nil {
        print(error!)
      } else {
        do {
          //let apiResponse = try JSONDecoder().decode(User.self, from: responseData!)
          completion(responseData as! AnyObject, nil)
        }catch {
          print(error)
          completion(nil, NetworkResponse.unableToDecode.rawValue)
        }
      }
    }
  }
  
  fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
    switch response.statusCode {
    case 200...299: return .success
    case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
    case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
    case 600: return .failure(NetworkResponse.outdated.rawValue)
    default: return .failure(NetworkResponse.failed.rawValue)
    }
  }
}



// MARK: - Sign Up
extension NetworkManager {
  func signUp(email: String,
              name: String,
              address: String,
              phone: String,
              password: String,
              password_confirmation: String, completion: @escaping (AnyObject? ,_ error: String?)->()) {
    router.request(.signUp(email: email,
                           name: name,
                           address: address,
                           phone: phone,
                           password: password,
                           password_confirmation: password_confirmation)) { (data, response, error) in
      if error != nil {
        completion(nil, "Please check your network connection.")
      }
      
      if let response = response as? HTTPURLResponse {
        let result = self.handleNetworkResponse(response)
        switch result {
        case .success:
          guard let responseData = data else {
            completion(nil, NetworkResponse.noData.rawValue)
            return
          }
          do {
            let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
            //print(jsonData)
            //let apiResponse = try JSONDecoder().decode(User.self, from: responseData)
            completion(jsonData as AnyObject, nil)
          }catch {
            print(error)
            completion(nil, NetworkResponse.unableToDecode.rawValue)
          }
        case .failure(let networkFailureError):
          completion(nil, networkFailureError)
        }
      }
    }
  }
}

// MARK: - Show Event
extension NetworkManager {
  func upcomingEvent(accessToken: String, completion: @escaping (Data? ,_ error: String?)->()) {
    router.request(.upcomingEvent(accessToken: accessToken)) { (data, response, error) in
      if error != nil {
        completion(nil, "Please check your network connection.")
      }
      
      if let response = response as? HTTPURLResponse {
        let result = self.handleNetworkResponse(response)
        switch result {
        case .success:
          guard let responseData = data else {
            completion(nil, NetworkResponse.noData.rawValue)
            return
          }
          do {
            let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
            //print(jsonData)
            //let apiResponse = try JSONDecoder().decode(User.self, from: responseData)
            completion(responseData, nil)
          }catch {
            print(error)
            completion(nil, NetworkResponse.unableToDecode.rawValue)
          }
        case .failure(let networkFailureError):
          completion(nil, networkFailureError)
        }
      }
    }
    
    //
    router.request(.latestEvent(accessToken: accessToken)) { (data, response, error) in
      if error != nil {
        completion(nil, "Please check your network connection.")
      }
      
      if let response = response as? HTTPURLResponse {
        let result = self.handleNetworkResponse(response)
        switch result {
        case .success:
          guard let responseData = data else {
            completion(nil, NetworkResponse.noData.rawValue)
            return
          }
          do {
            let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
            //print(jsonData)
            //let apiResponse = try JSONDecoder().decode(User.self, from: responseData)
            completion(responseData, nil)
          }catch {
            print(error)
            completion(nil, NetworkResponse.unableToDecode.rawValue)
          }
        case .failure(let networkFailureError):
          completion(nil, networkFailureError)
        }
      }
    }
  }
  
  func completedEvent(accessToken: String, completion: @escaping (Data? ,_ error: String?)->()) {
    router.request(.completedEvent(accessToken: accessToken)) { (data, response, error) in
    if error != nil {
      completion(nil, "Please check your network connection.")
    }
    
    if let response = response as? HTTPURLResponse {
      let result = self.handleNetworkResponse(response)
      switch result {
      case .success:
        guard let responseData = data else {
          completion(nil, NetworkResponse.noData.rawValue)
          return
        }
        do {
          let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
          //print(jsonData)
          //let apiResponse = try JSONDecoder().decode(User.self, from: responseData)
          completion(responseData, nil)
        }catch {
          print(error)
          completion(nil, NetworkResponse.unableToDecode.rawValue)
        }
      case .failure(let networkFailureError):
        completion(nil, networkFailureError)
      }
    }
    }
  }
}