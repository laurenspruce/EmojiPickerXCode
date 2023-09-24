//
//  ContentView.swift
//  example
//
//  Created by Lauren Spruce on 24/09/2023.
//  Very first swift app

import SwiftUI
import SwiftData

//list of cases you can define and pick from
//titled emoji, of raw value type string, need this to show in label
//caseiterable, protocol, loop over all emojis
enum Emoji: String, CaseIterable  {
    case 😍,😘,🥰,🤪,🥹
}

//selection is marked as a special piece of data
struct ContentView: View {
    //Tell your view to update
    @State var selection: Emoji = .😍
    
    var body: some View {
        //Adding a title for entire screen
        NavigationView {
            //vertically stack ui elements
            VStack {
                Text(selection.rawValue)
                //font modifier
                    .font(.system(size: 150))
            
            //Showing all options, $ is the binding of state, picker knows what is selected
                Picker("Select Emoji", selection: $selection) {
                    //For each of the cases of emoji, where id is case of itself, render a label with that emojis string representation. Looping over every case is emoji
                    ForEach(Emoji.allCases, id: \.self) { Emoji in
                        Text(Emoji.rawValue)
                    }
                }
                //modifying the picker style
                .pickerStyle(.segmented)
            }
            .navigationTitle("Emoji Selector!")
            .padding()
        }
        
    }
}

//What renders on the phone
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

