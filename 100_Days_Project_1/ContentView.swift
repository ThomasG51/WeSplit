//
//  ContentView.swift
//  100_Days_Project_1
//
//  Created by Thomas George on 06/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeopleSelected = 0
    @State private var tipPercentageSelected = 2
 
    let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double {
        let orderAmount: Double = Double(checkAmount) ?? 0
        let tip: Double = Double(tipPercentages[tipPercentageSelected])
        let people: Double = Double(numberOfPeopleSelected + 2)
        let totalWithTip = orderAmount + (orderAmount * tip / 100)
        
        return totalWithTip / people
    }
    
    var totalWithTip: Double {
        let orderAmount: Double = Double(checkAmount) ?? 0
        let tip: Double = Double(tipPercentages[tipPercentageSelected])
        
        return orderAmount + (orderAmount * tip / 100)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    Picker("People", selection: $numberOfPeopleSelected) {
                        ForEach(2..<11) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave ?")) {
                    Picker("Tip",selection: $tipPercentageSelected) {
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total Amount")) {
                    Text("$\(totalWithTip, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
                    // Specifier affiche 2 chiffre aprés la virgule
                    Text("$ \(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
