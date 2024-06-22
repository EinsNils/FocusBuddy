//
//  MainTabView.swift
//  FocusBuddy
//
//  Created by Nils Zentgraf on 22.06.24.
//

import SwiftUI

struct MainTabView: View {
    
    init(){

    }
    
    var body: some View {
        TabView{
            placeholderItemView("Home")
                .tabItem {
                    Image(systemName: Tab.home.icon)
                    Text(Tab.home.title)
                }
            
            placeholderItemView("Home")
                .tabItem {
                    Image(systemName: Tab.communities.icon)
                    Text(Tab.communities.title)
                }
            
            placeholderItemView("Home")
                .tabItem {
                    Image(systemName: Tab.settings.icon)
                    Text(Tab.settings.title)
                }
        }
    }
}

extension MainTabView{
    
    private func placeholderItemView(_ title: String) -> some View{
        ScrollView{
            VStack{
                ForEach(0..<120){ _ in
                    Text(title)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: 120)
                        .background(Color.green.opacity(0.5))
                }
            }
        }
    }
    
    private enum Tab: String{
        case communities, home, settings
        
        fileprivate var title: String{
            return rawValue.capitalized
        }
        
        fileprivate var icon: String{
            switch self {
            case .communities:
                return "person.3"
            case .home:
                return "house"
            case .settings:
                return "gear"
            }
        }
    }
}

#Preview {
    MainTabView()
}
