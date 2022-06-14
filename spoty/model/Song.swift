//
//  Song.swift
//  spoty
//
//  Created by Stavro Xhardha on 12.06.22.
//

import Foundation

struct Song  : Identifiable {
    var id: UUID
    let title : String
    let description : String
    
    init(id: UUID = UUID(), title: String, description: String){
        self.id = id
        self.title = title
        self.description = description
    }
}

extension Song {
    static var sampleData: [Song] {
        [
            Song(title: "Test1", description: "Desc1"),
            Song(title: "Test2", description: "Desc2"),
            Song(title: "Test3", description: "Desc3"),
            Song(title: "Test4", description: "Desc4"),
            Song(title: "Test5", description: "Desc5"),
            Song(title: "Test6", description: "Desc6"),
            Song(title: "Test7", description: "Desc7"),
        ]
    }
}
