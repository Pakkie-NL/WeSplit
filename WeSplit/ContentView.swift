//
//  ContentView.swift
//  WeSplit
//
//  Created by Aswin Pak on 22/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    //These are the variables we need for the calculation
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]    //This is an array of the amount for the percentages
    
    var body: some View {
        NavigationView{
            
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<20) {
                            Text ("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("tip percentage", selection: $tipPercentage) {
                    ForEach (0 ..< tipPercentages.count){
                        Text ("\(self.tipPercentages[$0])%")
                    }
                }
                    .pickerStyle(SegmentedPickerStyle())
                }
                    
                Section {
                    Text("€\(checkAmount)")
                }
            }
            .navigationBarTitle("We Split")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
