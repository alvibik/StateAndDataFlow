//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by albik on 28.11.2022.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    private let user = StorageManager.shared.fetchUser()
    //@StateObject private var userManager = UserManager()
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
