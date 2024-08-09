//
//  PostRow.swift
//  SocialCademy
//
//  Created by 김경완 on 8/9/24.
//

import SwiftUI

struct PostRow: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            //Hstack
            HStack {
                //Author Name
                Text(post.authorName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer()
                //Timestamp
                Text(post.timestamp.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
            }
            .foregroundColor(.gray)
            //Title
            Text(post.title)
                .font(.title3)
                .fontWeight(.semibold)
            //Content
            Text(post.content)
        }
        .padding(.vertical)
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            PostRow(post: Post.testPost)
        }
    }
}
