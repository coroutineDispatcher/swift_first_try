//
//  LoadNextRandomStateUseCase.swift
//  spoty
//
//  Created by Stavro Xhardha on 14.06.22.
//

import SwiftUI

class NextRandomStateUseCase {
    
    private let songsRepository : SongsRepository
    
    init(songsRepository: SongsRepository) {
        self.songsRepository = songsRepository
    }
    
    func loadNextRandomState() {
        self.songsRepository.nextRandomState()
    }
}
