//
//  DirectMessageDetailPresenter.swift
//  TwitterDM
//
//  Created Shashank Shandilya on 6/17/18.
//  Copyright © 2018 org. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class DirectMessageDetailPresenter: DirectMessageDetailPresenterProtocol {
    weak private var view: DirectMessageDetailViewProtocol?
    var interactor: DirectMessageDetailInteractorProtocol?
    private let router: DirectMessageDetailWireframeProtocol

    init(interface: DirectMessageDetailViewProtocol, interactor: DirectMessageDetailInteractorProtocol?, router: DirectMessageDetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewIsLoaded() {
        view?.showLoader()
        interactor?.getConversation({ [weak self] (conversation) in
            self?.view?.hideLoader()
            self?.createViewModel(for: conversation)
        }, failure: { [weak self] (error) in
            self?.view?.hideLoader()
            self?.view?.showError(errorMessage: error.localizedDescription)
        })
    }

    func createViewModel(for conversation: Conversation) {
        var messages: [DirectMessageDetailViewModel.Message] = []
        for event in conversation.events {
            messages.append(DirectMessageDetailViewModel.Message(text: event.messageCreate?.messageData?.text, isSent: event.messageCreate!.isSent))
        }
        view?.conversation = DirectMessageDetailViewModel.ViewModel(messages: messages, user: DirectMessageDetailViewModel.User(name: conversation.recipient.name, imageUrl: conversation.recipient.profileImageURL))
    }
    
    func userTappedOnSend(with message: String) {
        interactor?.postDirectMessage(message: message, onCompletion: { [weak self] in
            var conversation = self?.view?.conversation
            conversation?.messages.insert(DirectMessageDetailViewModel.Message(text: message, isSent: true), at: 0)
            self?.view?.conversation = conversation
        }, failure: { [weak self] (error) in
            self?.view?.showError(errorMessage: error.localizedDescription)
        })
    }
}