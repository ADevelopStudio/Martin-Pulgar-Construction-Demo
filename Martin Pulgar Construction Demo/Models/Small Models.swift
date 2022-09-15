//
//  Small Models.swift
//  Martin Pulgar Construction Demo
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import Foundation

struct RestResult: Codable {
    var success: Bool
}

struct DiaryReport: Codable {
    var location: String
    var comments: String?
    var images: [String]
    var date: Date
    var area: String?
    var category: String?
    var tags: String?
    var event: String?
}




struct FakeDataToSend: Codable {
    static let example: FakeDataToSend = FakeDataToSend(name: "Dmitrii Zverev", job: "iOS Developer")
    
    var name: String
    var job: String
}

struct FakeDataToRecieve: Codable {
    var name: String
    var job: String
    var id: String
}
