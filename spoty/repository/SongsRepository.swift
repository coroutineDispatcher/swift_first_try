//
//  SongsRepository.swift
//  spoty
//
//  Created by Stavro Xhardha on 14.06.22.
//

import Combine

protocol SongsRepository {
    func requireSongs()
    func attachSongsListener() -> AnyPublisher<AppResult, Error>
    func nextRandomState()
}
