//
//  ContentView.swift
//  CountdownTimer
//
//  Created by Witherton on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var countdownTimer = 5
    @State var timerRunning = false
  
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Countdown Timer")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(String(countdownTimer))
                .onReceive(timer) { _ in
                    if (countdownTimer > 0 && timerRunning){
                        countdownTimer -= 1
                    } else {
                        timerRunning = false
                    }
                }
                .font(.title)
                .fontWeight(.bold)
            
            HStack {
                
                Button {
                    timerRunning = true
                } label: {
                    Text("START")
                }
                
                Button {
                    countdownTimer = 5
                } label: {
                    Text("RESET")
                        .foregroundColor(Color.red)
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

