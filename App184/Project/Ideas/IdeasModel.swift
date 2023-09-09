//
//  IdeasModel.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI

struct IdeasModel: Identifiable {
    
    var id = UUID().uuidString
    
    let image: String
    let title: String
    let subtitle: String
}

struct VideoModel: Codable, Hashable {
    
    var errors: Bool
    
    var rows: [VideoItem]
}

struct VideoItem: Codable, Hashable {
    
    var id: Int?
    var categoryId: Int?
    var title: String?
    var image: String?
    var video: String?
    
    var duration: Int?
}
