//
//  GetSongsUseCase.swift
//  spoty
//
//  Created by Stavro Xhardha on 14.06.22.
//

import Combine

class GetSongsUseCase {
    let songsRepository: SongsRepository
    
    init(songsRepository: SongsRepository){
        self.songsRepository = songsRepository
    }
    
    func getSongs() {
        self.songsRepository.requireSongs()
    }
}
