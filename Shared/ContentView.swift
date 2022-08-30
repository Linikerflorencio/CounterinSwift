//
//  ContentView.swift
//  Shared
//
//  Created by Liniker Florencio Mendonça on 29/08/22.
//

import SwiftUI

class Counter: ObservableObject {
    
    @Published var days = 0
    @Published var hours = 0
    @Published var minutes = 0
    @Published var seconds = 0
    
    
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { Timer in
            let calendar = Calendar.current
            
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
            let currentDate = calendar.date(from: components)
            
            var eventDateComponents = DateComponents()
            eventDateComponents.year = 2022
            eventDateComponents.month = 09
            eventDateComponents.day = 23
            eventDateComponents.hour = 8
            eventDateComponents.minute = 0
            eventDateComponents.second = 0
            
            let niverData = calendar.date(from: eventDateComponents)
            
            let timeLeft = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate!, to: niverData!)
            
            self.days = timeLeft.day ?? 0
            self.hours = timeLeft.hour ?? 0
            self.minutes = timeLeft.minute ?? 0
            self.seconds = timeLeft.second ?? 0
            
        }
    }
}

struct ContentView: View {
    
   @StateObject var counter = Counter()
    
    var body: some View {
        VStack {
            Text("Quanto tempo falta para o meu Niver? xD")
            HStack{
                Text("\(counter.days) Dias")
                Text("\(counter.hours) Horas")
                Text("\(counter.minutes) Min")
                Text("\(counter.seconds) Seg")
            }
        }
            
            
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            ContentView()
                
        }
    }
}
