//
//  Target.swift
//  Model Generated using http://www.jsoncafe.com/ 

import Foundation

struct Target : Codable {
    let recipientId : String?

    enum CodingKeys: String, CodingKey {
        case recipientId = "recipient_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        recipientId = try values.decodeIfPresent(String.self, forKey: .recipientId)
    }
}
