//
//  NetworkRouter.swift
//  NetworkLayerDemo
//
//  Created by Hoang Trong Kien on 7/8/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
