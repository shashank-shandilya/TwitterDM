//
//  Conversation.swift
//  TwitterDM
//
//  Created by Shashank Shandilya on 6/17/18.
//  Copyright © 2018 org. All rights reserved.
//

import Foundation
import TwitterKit

struct Conversation {
    var events: [Event]
    let recipient: TWTRUser
}
