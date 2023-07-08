//
//  ContentView.swift
//  TimerSwiftUI
//
//  Created by sss on 08.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var count = 0
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.pink, Color.white]),
                           center: .center,
                           startRadius: 5,
                           endRadius: 500)
            .ignoresSafeArea()
            
            HStack {
                Circle()
                    .offset(y: count == 1 ? -20 : 0)
                Circle()
                    .offset(y: count == 2 ? -20 : 0)
                Circle()
                    .offset(y: count == 3 ? -20 : 0)
            }
            .frame(width: 100)
            .foregroundColor(.white)
        }
       
        .onReceive(timer) { _ in
            withAnimation(.easeOut(duration: 0.5)) {
                count = count == 3 ? 0 : count + 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




/*
 //TIMER - Every second//
 
 struct ContentView: View {
     
     @State var currentDate: Date = Date()
     var dateFormatter: DateFormatter {
         let formatter = DateFormatter()
         formatter.timeStyle = .medium
         return formatter
     }
     
     //main - так как будем обновлять пользовательский интерфейс, но можно и current
     let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
     
     var body: some View {
         ZStack {
             RadialGradient(gradient: Gradient(colors: [Color.pink, Color.white]),
                            center: .center,
                            startRadius: 5,
                            endRadius: 500)
             .ignoresSafeArea()
             
             Text(dateFormatter.string(from: currentDate))
                 .font(.system(size: 100))
                 .foregroundColor(.white)
                 .lineLimit(1)
                 .minimumScaleFactor(0.1)
         }
        
         .onReceive(timer) { value in
             currentDate = value
         }
     }
 }

 */

/*
 ///Countdown
 struct ContentView: View {
     
     @State var count = 10
     @State var finished: String? = nil
     
     let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
     
     var body: some View {
         ZStack {
             RadialGradient(gradient: Gradient(colors: [Color.pink, Color.white]),
                            center: .center,
                            startRadius: 5,
                            endRadius: 500)
             .ignoresSafeArea()
             
             Text(finished ?? "\(count)")
                 .font(.system(size: 100))
                 .foregroundColor(.white)
                 .lineLimit(1)
                 .minimumScaleFactor(0.1)
         }
        
         .onReceive(timer) { _ in
             if count <= 1 {
                 finished = "Wow!"
             } else {
                 count -= 1
             }
         }
     }
 }

 */


/*
 struct ContentView: View {
     
     @State var timeRemaining = ""
     let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
     
     let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
     
     var body: some View {
         ZStack {
             RadialGradient(gradient: Gradient(colors: [Color.pink, Color.white]),
                            center: .center,
                            startRadius: 5,
                            endRadius: 500)
             .ignoresSafeArea()
             
             Text(timeRemaining)
                 .font(.system(size: 100))
                 .foregroundColor(.white)
                 .lineLimit(1)
                 .minimumScaleFactor(0.1)
         }
        
         .onReceive(timer) { _ in
             updateTimeRemainig()
         }
     }
     
     func updateTimeRemainig() {
         let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
         let minute = remaining.minute ?? 0
         let second = remaining.second ?? 0
         timeRemaining = "\(minute):\(second)"
     }
 }

 */


