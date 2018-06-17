//
//  DirectMessageListModel.swift
//  TwitterDM
//
//  Created by Shashank Shandilya on 6/17/18.
//  Copyright © 2018 org. All rights reserved.
//

import Foundation

enum DirectMessageListViewModel {
    struct Recipients {
        let recipientId: String
        let messages: [Message]
        var recentMessage: Message? {
            return messages.first
        }
    }
    
    struct Message {
        let text: String?
        let isSent: Bool
    }
}
