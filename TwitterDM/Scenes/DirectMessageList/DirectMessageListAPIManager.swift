//
//  DirectMessageListAPIManager.swift
//  TwitterDM
//
//  Created by Shashank Shandilya on 6/17/18.
//  Copyright © 2018 org. All rights reserved.
//

import Foundation
import TwitterKit

class DirectMessageListAPIManager {
    func fetchDirectMessageList(_ success: @escaping (_ directMessageList: DirectMessageList) -> Void, failure: @escaping (_ error: Error) -> Void) {
        // Get the current userID. This value should be managed by the developer but can be retrieved from the TWTRSessionStore.
        if let userID = TWTRTwitter.sharedInstance().sessionStore.session()?.userID {
            let client = TWTRAPIClient(userID: userID)
            // make requests with client
            var request = URLRequest(url: URL(string: "https://api.twitter.com/1.1/direct_messages/events/list.json")!)
            request.httpMethod = "GET"
            client.sendTwitterRequest(request, completion: { (response, data, error) in
                if error != nil {
                    failure(error!)
                } else {
                    if let d = data {
                        print(NSString(string: String(bytes: d, encoding: String.Encoding.utf8)!))
                        let list = try! JSONDecoder().decode(DirectMessageList.self, from: d)
                        success(list)
                    } else {
                        failure(NSError(domain: "APIError", code: 1, userInfo: nil))
                    }
                }
            })
        }
    }
}
