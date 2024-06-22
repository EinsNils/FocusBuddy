//
//  SplashScreen.swift
//  FocusBuddy
//
//  Created by Nils Zentgraf on 22.06.24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack{
            Color("main")
                .ignoresSafeArea(.all)
            
            Text("FocusBuddy")
                .font(.largeTitle).bold()
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    SplashScreen()
}
