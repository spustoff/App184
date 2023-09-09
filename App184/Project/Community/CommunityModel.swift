//
//  CommunityModel.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI

struct CommunityModel: Identifiable {
    
    var id = UUID().uuidString
    
    var author_name: String
    var author_image: String
    
    var post_image: String
    var post_title: String
    var post_text: String
}
