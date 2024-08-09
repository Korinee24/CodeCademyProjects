//
//  Post.swift
//  SocialCademy
//
//  Created by 김경완 on 8/9/24.
//

import Foundation

struct Post: Identifiable, Codable {
    //Properties
    var title: String
    var content: String
    var authorName: String
    var timestamp = Date()
    
    var id = UUID()
    
    func contains(_ string: String) -> Bool {
        let properties = [title, content, authorName].map { $0.lowercased() }
        let query = string.lowercased()
        
        let matches = properties.filter { $0.contains(query) }
        
        return !matches.isEmpty
    }
}

//Test Data
extension Post {
    static let testPost = Post(title: "Test Post", content: "abcdefg hijk lmn opqr stu vwxyz", authorName: "Eric Kim")
}
