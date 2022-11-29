//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by albik on 28.11.2022.
//

import Foundation

final class UserManager: ObservableObject {
    @Published var user = User()
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var name = ""
    var isRegister = false
}
