//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by albik on 28.11.2022.
//

import SwiftUI

struct RegisterView: View {
    //@State private var name = ""
    @EnvironmentObject private var user: UserManager
    
//    @AppStorage("user") private var userStorage = ""

    private var activateButton: Bool {
        user.user.name.count < 3 ? true : false
    }
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $user.user.name)
                    .multilineTextAlignment(.center)
                Text(user.user.name.count.formatted())
                    .foregroundColor(user.user.name.count < 3 ? .red : .green)
            }
            Button(action: registerUser) {
                Image(systemName: "checkmark.circle")
                Text("LogIn")
            }.disabled(activateButton)
        }.padding()
    }
    private func registerUser(){
        user.user.isRegister.toggle()
        StorageManager.shared.save(user: user.user)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager(user: User()))
    }
}
