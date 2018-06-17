//
//  DirectMessageDetailAPIManager.swift
//  TwitterDM
//
//  Created by Shashank Shandilya on 6/17/18.
//  Copyright © 2018 org. All rights reserved.
//

import Foundation
import TwitterKit

class DirectMessageDetailAPIManager {
    func postDirectMessage(message: String, recipientID: String, success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        // Get the current userID. This value should be managed by the developer but can be retrieved from the TWTRSessionStore.
        if let userID = TWTRTwitter.sharedInstance().sessionStore.session()?.userID {
            let client = TWTRAPIClient(userID: userID)
            // make requests with client
            var error: NSError? = nil
            let param = ["user_id": recipientID, "text": message]
            let request = client.urlRequest(withMethod: "POST", urlString: "https://api.twitter.com/1.1/direct_messages/new.json", parameters: param, error: &error)
            if error != nil {
                print(error!)
                return
            }
            
            client.sendTwitterRequest(request, completion: { (response, data, error) in
                if error != nil {
                    failure(error!)
                } else {
                    if let d = data {
                        print(NSString(string: String(bytes: d, encoding: String.Encoding.utf8)!))
                        success()
                    } else {
                        failure(NSError(domain: "APIError", code: 1, userInfo: nil))
                    }
                }
            })
        }
    }
}
