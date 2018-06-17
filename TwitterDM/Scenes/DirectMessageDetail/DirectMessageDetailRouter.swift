//
//  DirectMessageDetailRouter.swift
//  TwitterDM
//
//  Created Shashank Shandilya on 6/17/18.
//  Copyright © 2018 org. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class DirectMessageDetailRouter: DirectMessageDetailWireframeProtocol {
    weak var viewController: UIViewController?
    
    static func createModule(with recipientID: String, events: [Event]) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = DirectMessageDetailViewController(tableViewStyle: .plain)!
        let interactor = DirectMessageDetailInteractor(recipientID: recipientID, events: events)
        let router = DirectMessageDetailRouter()
        let presenter = DirectMessageDetailPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
