//
//  HomeScreen.swift
//  FocusBuddy
//
//  Created by Nils Zentgraf on 22.06.24.
//

import SwiftUI

struct HomeScreen: View {
    
    @State var time = 0
    @State var timerActive = false
    @State var timer: Timer? = nil
    @State var totalTime = 5 * 60 // Total time set to 5 minutes (300 seconds)
    
    var body: some View {
        ZStack{
            NavigationStack{
                VStack(alignment: .leading){
                    HeaderItemView()
                    
                    TimerView(time: $time, totalTime: $totalTime)
                    
                    StartStopButtons(time: $time, totalTime: $totalTime, timerActive: $timerActive, timer: $timer)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .background(Color("bg"))
        .onDisappear {
            timer?.invalidate()
        }
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

private struct TimerView: View {
    @Binding var time: Int
    @Binding var totalTime: Int
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 15)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(time) / CGFloat(totalTime))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .animation(.linear, value: time)
            
            Text("Time: \(time)")
                .font(.title)
                .bold()
        }
        .padding(20)
    }
}

private struct StartStopButtons: View {
    @Binding var time: Int
    @Binding var totalTime: Int
    @Binding var timerActive: Bool
    @Binding var timer: Timer?
    
    var body: some View {
        HStack{
            Button(action: {
                if !timerActive {
                    time = totalTime
                    timerActive = true
                    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                        if time > 0 {
                            time -= 1
                        } else {
                            timer?.invalidate()
                            timerActive = false
                        }
                    }
                }
            }, label: {
                Text("Start")
            })
            
            Spacer()
            
            Button(action: {
                timer?.invalidate()
                timerActive = false
                time = 0
            }, label: {
                Text("Stop")
            })
        }
    }
}

#Preview {
    HomeScreen()
}
