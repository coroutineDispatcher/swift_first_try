//
//  AppResult.swift
//  spoty
//
//  Created by Stavro Xhardha on 12.06.22.
//

import Foundation

enum AppResult : CaseIterable {
    static var allCases: [AppResult] = [.error, .loading, .empty, .success(Song.sampleData)]
    
    case error
    case loading
    case empty
    case success([Song])
}

