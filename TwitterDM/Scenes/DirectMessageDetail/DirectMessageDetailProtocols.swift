//
//  DirectMessageDetailProtocols.swift
//  TwitterDM
//
//  Created Shashank Shandilya on 6/17/18.
//  Copyright © 2018 org. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol DirectMessageDetailWireframeProtocol: class {

}

//MARK: Presenter -
protocol DirectMessageDetailPresenterProtocol: class {
    func viewIsLoaded()
    func userTappedOnSend(with message: String)
}

//MARK: Interactor -
protocol DirectMessageDetailInteractorProtocol: class {
    var presenter: DirectMessageDetailPresenterProtocol?  { get set }
    func getConversation(_ onCompletion: @escaping (Conversation) -> Void, failure: @escaping (Error) -> Void)
    func postDirectMessage(message: String, onCompletion: @escaping () -> Void, failure: @escaping (Error) -> Void)
}

//MARK: View -
protocol DirectMessageDetailViewProtocol: class {
    var presenter: DirectMessageDetailPresenterProtocol?  { get set }
    func showLoader()
    func hideLoader()
    func showError(errorMessage: String)
    var conversation: DirectMessageDetailViewModel.ViewModel? { get set }
}
