//
//  MessageCreate.swift
//  Model Generated using http://www.jsoncafe.com/ 

import Foundation
import TwitterKit

struct MessageCreate : Codable {
    let target : Target?
    let senderId : String?
    let sourceAppId : String?
    let messageData : MessageData?
    let isSent: Bool
    
    enum CodingKeys: String, CodingKey {
        case target = "target"
        case senderId = "sender_id"
        case sourceAppId = "source_app_id"
        case messageData = "message_data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        target = try values.decodeIfPresent(Target.self, forKey: .target)
        senderId = try values.decodeIfPresent(String.self, forKey: .senderId)
        sourceAppId = try values.decodeIfPresent(String.self, forKey: .sourceAppId)
        messageData = try values.decodeIfPresent(MessageData.self, forKey: .messageData)
        isSent = (TWTRTwitter.sharedInstance().sessionStore.session()?.userID == senderId)
    }
}
