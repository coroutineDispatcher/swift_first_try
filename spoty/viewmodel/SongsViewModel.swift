//
//  File.swift
//  spoty
//
//  Created by Stavro Xhardha on 12.06.22.
//

import SwiftUI
import Combine

class SongsViewModel : ObservableObject {
    
    @Published var songsState : AppResult = .loading
    var bag: Set<AnyCancellable> = []
    private let getSongsUseCase: GetSongsUseCase
    private let attachSongsListenerUseCase: AttachSongsListenerUseCase
    private let nextRandomStateUseCase : NextRandomStateUseCase
    
    init(getSongsUseCase: GetSongsUseCase, attachSongsListenerUseCase: AttachSongsListenerUseCase, nextRandomStateUseCase: NextRandomStateUseCase) {
        self.getSongsUseCase = getSongsUseCase
        self.attachSongsListenerUseCase = attachSongsListenerUseCase
        self.nextRandomStateUseCase = nextRandomStateUseCase
        
        self.attachSongsListenerUseCase.attachListener()
            .delay(for: 5, scheduler: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    print(completion)
                },
                receiveValue: { appResult in
                    print(appResult)
                    self.songsState = appResult
                }
            ).store(in: &bag)
    }
    
    func getSongs() {
        getSongsUseCase.getSongs()
    }
    
    func nextRandomState() {
        nextRandomStateUseCase.loadNextRandomState()
    }
    
    // Todo later
    //    func shuffleOrder() {
    //        songs.shuffle()
    //    }
}
