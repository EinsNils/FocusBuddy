//
//  ContentView.swift
//  FocusBuddy
//
//  Created by Nils Zentgraf on 22.06.24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplashScreen = true
    @AppStorage("hasStarted") private var hasStarted: Bool = false
    
    var body: some View {
        ZStack {
            if showSplashScreen {
                SplashScreen()
                    .transition(.opacity)
                    .animation(.easeOut(duration: 1.5))
            } else {
                if hasStarted {
                    MainTabView()
                } else {
                    WelcomeScreen()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.showSplashScreen = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
