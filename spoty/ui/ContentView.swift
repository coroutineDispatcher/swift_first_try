//
//  ContentView.swift
//  spoty
//
//  Created by Stavro Xhardha on 12.06.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel =
    SongsViewModel(
        getSongsUseCase: DependencyLocator.getSongsUseCase(),
        attachSongsListenerUseCase: DependencyLocator.attachSongsListenerUseCase(),
        nextRandomStateUseCase: DependencyLocator.nextRandomStateUseCase()
    )
    
    var body: some View {
        VStack {
            switch(self.viewModel.songsState) {
            case .success(let data):
                List {
                    ForEach(data) { song in
                        VStack(alignment: .leading) {
                            Text(song.title).padding(10)
                            Text(song.description).padding(10)
                        }
                    }
                }.onAppear(perform: viewModel.nextRandomState)
                
            case .empty:
                Text("No data here")
                    .font(.largeTitle)
                    .border(.pink)
                    .padding().onAppear(perform: viewModel.nextRandomState)
                
            case .loading:
                ProgressView().progressViewStyle(CircularProgressViewStyle()).onAppear(perform: viewModel.nextRandomState)
                
            case .error:
                Text("An error occurred")
                    .font(.largeTitle)
                    .border(.pink)
                    .padding().onAppear(perform: viewModel.nextRandomState)
                
            default: EmptyView().onAppear(perform: viewModel.nextRandomState)
            }
        }.onAppear(perform: viewModel.getSongs)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
