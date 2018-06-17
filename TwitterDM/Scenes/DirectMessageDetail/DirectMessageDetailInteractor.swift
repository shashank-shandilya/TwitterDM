//
//  DirectMessageDetailInteractor.swift
//  TwitterDM
//
//  Created Shashank Shandilya on 6/17/18.
//  Copyright © 2018 org. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import TwitterKit

class DirectMessageDetailInteractor: DirectMessageDetailInteractorProtocol {
    weak var presenter: DirectMessageDetailPresenterProtocol?
    var recipientID: String
    var events: [Event]
    lazy var apiManager = DirectMessageDetailAPIManager()
    
    init(recipientID: String, events: [Event]) {
        self.recipientID = recipientID
        self.events = events
    }
    
    func getConversation(_ onCompletion: @escaping (Conversation) -> Void, failure: @escaping (Error) -> Void) {
        // Get the current userID. This value should be managed by the developer but can be retrieved from the TWTRSessionStore.
        if let userID = TWTRTwitter.sharedInstance().sessionStore.session()?.userID {
            let client = TWTRAPIClient(userID: userID)
            client.loadUser(withID: recipientID, completion: { [weak self] (user, error) in
                guard let strongSelf = self else {
                    return
                }
                
                if let user = user {
                    onCompletion(Conversation(events: strongSelf.events, recipient: user))
                } else {
                    failure(error!)
                }
            })
        }
    }
    
    func postDirectMessage(message: String, onCompletion: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        apiManager.postDirectMessage(message: message, recipientID: recipientID, success: {
            onCompletion()
        }) { (error) in
            failure(error)
        }
    }
}
