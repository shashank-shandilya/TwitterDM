//
//  MessageData.swift
//  Model Generated using http://www.jsoncafe.com/ 

import Foundation

struct MessageData : Codable {
    let text : String?
//    let entities : Entity?

    enum CodingKeys: String, CodingKey {
        case text = "text"
//        case entities = "entities"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
//        entities = try values.decodeIfPresent(Entity.self, forKey: .entities)
    }
}
