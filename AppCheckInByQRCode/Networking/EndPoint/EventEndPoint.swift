//
//  EventEndPoint.swift
//  NetworkLayerDemo
//
//  Created by Hoang Trong Kien on 7/8/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

enum NetworkEnvironment {
  case login, logout, signup, upcomingEvent, latestEvent, completedEvent
}

public enum EventApi {
  case login(email: String, password: String)
  case logout(accessToken: String)
  case signUp(email: String, name: String, address: String, phone: String, password: String, password_confirmation: String)
  case upcomingEvent(accessToken: String)
  case latestEvent(accessToken: String)
  case completedEvent(accessToken: String)
}

extension EventApi: EndPointType {
  
  var environmentBaseURL : String {
    switch NetworkManager.environment {
    case .login, .logout, .signup, .upcomingEvent, .latestEvent, .completedEvent:
      return "http://events.sdc.click/api/"
    }
  }
  
  var baseURL: URL {
    guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
    return url
  }
  
  var path: String {
    switch self {
    case .login:
      return "login"
    case .logout:
      return "logout"
    case .signUp:
      return "register"
    case .upcomingEvent:
      return "event/list"
    case .latestEvent:
      return "event/list_happen"
    case .completedEvent:
      return "event/list_happened"
    }
  }
  
  var httpMethod: HTTPMethod {
    switch self {
    case .login:
      return .post
    case .logout:
      return .get
    case .signUp:
      return .post
    case .upcomingEvent, .latestEvent, .completedEvent:
      return .get
    }
  }
  
  var task: HTTPTask {
    switch self {
    case .completedEvent(let accessToken),
         .upcomingEvent(let accessToken),
         .latestEvent(let accessToken),
         .logout(let accessToken):
      return .requestParametersAndHeaders(bodyParameters: nil,
                                          bodyEncoding: .urlEncoding,
                                          urlParameters: nil,
                                          additionHeaders: ["Authorization" : "Bearer \(accessToken)"])
      
    case .signUp(let email, let name, let address, let phone, let password, let password_confirmation):
      return .requestParameters(bodyParameters: nil,
                                bodyEncoding: .urlEncoding,
                                urlParameters: ["email": email,
                                                "name": name,
                                                "address": address,
                                                "phone": phone,
                                                "password": password,
                                                "password_confirmation": password_confirmation])
      
    case .login(let email, let password):
      return .requestParameters(bodyParameters: nil,
                                bodyEncoding: .urlEncoding,
                                urlParameters: ["email": email, "password": password])
    }
  }
  
  var headers: HTTPHeaders? {
    return nil
  }
}


