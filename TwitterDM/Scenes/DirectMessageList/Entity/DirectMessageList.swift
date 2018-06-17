//
//  DirectMessageList.swift
//  Model Generated using http://www.jsoncafe.com/ 

import Foundation

struct DirectMessageList : Codable {
    let events : [Event]

    enum CodingKeys: String, CodingKey {
        case events = "events"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        events = try values.decode([Event].self, forKey: .events)
    }
}
