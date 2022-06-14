//
//  DependencyLocator.swift
//  spoty
//
//  Created by Stavro Xhardha on 12.06.22.
//

import Foundation

class DependencyLocator {
    private static let songsRepository : SongsRepository = DefaultSongsRepository()
    
    static func getSongsUseCase() -> GetSongsUseCase {
        return GetSongsUseCase(songsRepository: self.songsRepository)
    }
    
    static func attachSongsListenerUseCase() -> AttachSongsListenerUseCase {
        AttachSongsListenerUseCase(songsRepository: self.songsRepository)
    }
    
    static func nextRandomStateUseCase() -> NextRandomStateUseCase {
        NextRandomStateUseCase(songsRepository: self.songsRepository)
    }
    
}
