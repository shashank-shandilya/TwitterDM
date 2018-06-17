//
//  Event.swift
//  Model Generated using http://www.jsoncafe.com/ 

import Foundation

struct Event : Codable {
    let type : String?
    let id : String?
    let createdTimestamp : String?
    let messageCreate : MessageCreate?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case createdTimestamp = "created_timestamp"
        case messageCreate = "message_create"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        createdTimestamp = try values.decodeIfPresent(String.self, forKey: .createdTimestamp)
        messageCreate = try values.decodeIfPresent(MessageCreate.self, forKey: .messageCreate)
    }
}
