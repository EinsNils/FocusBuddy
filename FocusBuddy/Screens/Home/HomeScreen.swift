//
//  HomeScreen.swift
//  FocusBuddy
//
//  Created by Nils Zentgraf on 22.06.24.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack{
            NavigationStack{
                VStack(alignment: .leading){
                    HeaderItemView()
                    
                    Spacer()
                }
            }
        }
        .background(Color("bg"))
    }
}

private struct HeaderItemView: View {
    var body: some View {
        HStack{
            Text("Guten Morgen, \nNils")
                .font(.title).bold()
            
            Spacer()
            
            Button(action: {}, label: {
                Image(.pb)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .clipShape(Circle())
            })
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeScreen()
}
