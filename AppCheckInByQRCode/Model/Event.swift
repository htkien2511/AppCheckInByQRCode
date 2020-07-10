//
//  Event.swift
//  NetworkLayerDemo
//
//  Created by Hoang Trong Kien on 7/9/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import Foundation

// MARK: - EventElement
struct EventElement: Codable {
    let name, intro, chairman, image: String
    let place: String
}

typealias Event = [EventElement]
