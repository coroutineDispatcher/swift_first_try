//
//  AttachSongsListenerUseCase.swift
//  spoty
//
//  Created by Stavro Xhardha on 14.06.22.
//

import SwiftUI
import Combine

class AttachSongsListenerUseCase {
    let songsRepository : SongsRepository
    
    init(songsRepository: SongsRepository) {
        self.songsRepository = songsRepository
    }
    
    func attachListener() -> AnyPublisher<AppResult, Error> {
        songsRepository.attachSongsListener()
    }
}
