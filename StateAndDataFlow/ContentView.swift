//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by albik on 28.11.2022.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(user.user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            VStack{
                Spacer()
                buttonView(action: timer.startTimer, text: timer.buttonTitle, color: .blue)
                    .padding(150)
                buttonView(action: logout, text: "LogOUT", color: .red)
            }
        }
        .padding()
    }
    private func logout() {
        StorageManager.shared.clear(userManager: user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager(user: User()))
    }
}

struct buttonView: View {
    let action: () -> ()
    let text: String
    let color: Color
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
                .frame(width: 140, height: 40)
                .background(color)
                .cornerRadius(10)
                .shadow(color: color, radius: 6)
    }
}
