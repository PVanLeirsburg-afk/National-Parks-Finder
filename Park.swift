//
//  Park.swift
//  National Parks Finder
//
//  Created by Pamela VanLeirsburg on 6/30/26.
//

import Foundation

struct ParkResponse: Codable {
    let data: [Park]
}

struct Park: Codable, Identifiable {
    let id: String
    let fullName: String
    let latitude: String
    let longitude: String
}
