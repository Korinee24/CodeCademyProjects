//
//  NewPostForm.swift
//  SocialCademy
//
//  Created by 김경완 on 8/9/24.
//

import SwiftUI

struct NewPostForm: View {
    typealias CreateAction = (Post) async throws -> Void
    let createAction: CreateAction
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var post = Post(title: "", content: "", authorName: "")
    @State private var state = FormState.idle
    
    var body: some View {
        //Navigation View
        NavigationView {
            //Form Start
            Form {
                //section 1
                Section {
                    //Title TextField
                    TextField("Title", text: $post.title)
                    //Author Name Text Field
                    TextField("Author Name", text: $post.authorName)
                }
                
                //section 2
                Section("Content") {
                    TextEditor(text: $post.content)
                        .multilineTextAlignment(.leading)
                }
                
                //Create post action Button
                Button(action: createPost) {
                    if state == .working {
                        ProgressView()
                    } else {
                        Text("Create Post")
                    }
                }
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .padding()
                .listRowBackground(Color.accentColor)
            }
            .navigationTitle("New Post")
            .onSubmit(createPost)
        }
        .disabled(state == .working)
        .alert("Cannot Create Post", isPresented: $state.isError, actions: {}) {
            Text("Sorry, something went wrong.")
        }
    }
    
    private func createPost() {
        Task {
            state = .working
            do {
                try await createAction(post)
                dismiss()
            } catch {
                print("[NewPostForm] Cannot create post: \(error)")
                state = .error
            }
        }
    }
}

private extension NewPostForm {
    enum FormState {
        case idle, working, error
        
        var isError: Bool {
            get {
                self == .error
            }
            set {
                guard !newValue else { return }
                self = .idle
            }
        }
    }
}

struct NewPostForm_Previews: PreviewProvider {
    static var previews: some View {
        NewPostForm(createAction: { _ in })
    }
}
