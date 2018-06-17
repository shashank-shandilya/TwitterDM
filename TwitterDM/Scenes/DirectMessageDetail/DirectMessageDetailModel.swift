//
//  DirectMessageDetailModel.swift
//  TwitterDM
//
//  Created by Shashank Shandilya on 6/17/18.
//  Copyright © 2018 org. All rights reserved.
//

import Foundation

enum DirectMessageDetailViewModel {
    struct ViewModel {
        var messages: [Message]
        let user: User
    }
    
    struct Message {
        let text: String?
        let isSent: Bool
    }
    
    struct User {
        let name: String
        let imageUrl: String
    }
}
