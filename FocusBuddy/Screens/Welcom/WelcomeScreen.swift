//
//  WelcomeScreen.swift
//  FocusBuddy
//
//  Created by Nils Zentgraf on 22.06.24.
//

import SwiftUI

struct WelcomeScreen: View {
    
    @AppStorage("hasStarted") private var hasStarted: Bool = false
    
    var body: some View {
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                WelcomeContentView()
                
                Spacer()
                
                WelcomeButtonView(hasStarted: $hasStarted)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 50)
            }
        }
    }
}

private struct WelcomeContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image("time")
                .resizable()
                .scaledToFit()
                .frame(height: 195)
            
            Text("Focus Buddy")
                .font(.system(size: 25)).bold()
                .foregroundColor(Color("main"))
            
            Text("Here’s a good place for a brief overview of the app or its key features.")
                .foregroundColor(.gray)
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
    }
}

private struct WelcomeButtonView: View {
    
    @Binding var hasStarted: Bool
    
    var body: some View {
        Button(action: {
            hasStarted = true
        }, label: {
            Text("Get started")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("main"))
                .cornerRadius(10)
        })
    }
}

#Preview {
    WelcomeScreen()
}

