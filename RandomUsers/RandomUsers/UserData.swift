//
//  UserData.swift
//  RandomUsers
//
//  Created by 김경완 on 8/8/24.
//

import Foundation

@MainActor
class UserData: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        Task {
            await loadUsers()
        }
        
        func loadUsers() async {
            do {
                let users = try await UserFetchingClient.getUsers()
                self.users = users
            } catch {
                print(error)
            }
        }
    }
}
