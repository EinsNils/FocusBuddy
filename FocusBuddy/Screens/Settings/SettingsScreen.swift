//
//  SettingsScreen.swift
//  FocusBuddy
//
//  Created by Nils Zentgraf on 23.06.24.
//

import SwiftUI

struct SettingsScreen: View {
    
    @AppStorage("hasStarted") private var hasStarted: Bool = false
    
   var body: some View {
       Button(action: {
           hasStarted.toggle()
       }, label: {
           /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
       })
    }
}

#Preview {
    SettingsScreen()
}
