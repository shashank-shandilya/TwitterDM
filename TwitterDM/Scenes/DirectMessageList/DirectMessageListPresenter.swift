//
//  DirectMessageListPresenter.swift
//  TwitterDM
//
//  Created Shashank Shandilya on 6/17/18.
//  Copyright © 2018 org. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class DirectMessageListPresenter: DirectMessageListPresenterProtocol {
    weak private var view: DirectMessageListViewProtocol?
    var interactor: DirectMessageListInteractorProtocol?
    private let router: DirectMessageListWireframeProtocol

    init(interface: DirectMessageListViewProtocol, interactor: DirectMessageListInteractorProtocol?, router: DirectMessageListWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func userTapped(on item: DirectMessageListViewModel.Recipients) {
        if let interactor = interactor {
            let events = interactor.events(for: item.recipientId)
            router.routeToDetailScreen(withRecipientID: item.recipientId, and: events)
        }
    }
    
    func userRefreshedThePage() {
        fetchDirectMessages()
    }
    
    func viewIsLoaded() {
        fetchDirectMessages()
    }
    
    func fetchDirectMessages() {
        view?.showLoader()
        interactor?.fetchDirectMessageList({ [weak self] (response) in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.view?.hideLoader()
            strongSelf.updateView(for: response)
            }, failure: { [weak self] (error) in
                self?.view?.hideLoader()
                self?.view?.showError(errorMessage: error.localizedDescription)
        })
    }
    
    func updateView(for response: [[String: [Event]]]) {
        var recipients = [DirectMessageListViewModel.Recipients]()
        for object in response {
            let recipientID = object.keys.first!
            let events = object.values.first!
            
            var messagesViewModel = [DirectMessageListViewModel.Message]()
            for event in events {
                let message = DirectMessageListViewModel.Message(text: event.messageCreate?.messageData?.text, isSent: event.messageCreate!.isSent)
                messagesViewModel.append(message)
            }
            
            recipients.append(DirectMessageListViewModel.Recipients(recipientId: recipientID, messages: messagesViewModel))
        }
        
        self.view?.recipients = recipients
    }
}