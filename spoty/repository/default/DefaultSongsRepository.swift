//
//  DefaultSongsRepository.swift
//  spoty
//
//  Created by Stavro Xhardha on 12.06.22.
//

import Combine
import SwiftUI

class DefaultSongsRepository : SongsRepository {
    
    private let currentValueSubject = CurrentValueSubject<AppResult, Error>(.loading)
    private let passThroughSubject = PassthroughSubject<AppResult, Never>()
    var bag: Set<AnyCancellable> = []
    
    func requireSongs() {
        self.passThroughSubject.sink(receiveValue: { appResult in
            self.currentValueSubject.send(appResult)
        }).store(in: &bag)
    }
    
    func attachSongsListener() -> AnyPublisher<AppResult, Error> {
        self.currentValueSubject.eraseToAnyPublisher()
    }
    
    func nextRandomState() {
        passThroughSubject.send(.allCases.randomElement()!)
    }
}
