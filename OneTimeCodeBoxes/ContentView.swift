//
//  ContentView.swift
//  OneTimeCodeBoxes
//
//  Created by HikingWithSwift on 2021-04-10.
//

import SwiftUI

struct ContentView: View {
    
    static let codeDigits = 6
    @State
    var codeDict = Dictionary<Int, String>(uniqueKeysWithValues: (0..<codeDigits).map{ ($0, "") })
    // [0:"", 1:"", ..., 5:""]
    @State
    var firstResponderIndex = 0
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Hello, OneTimeCodeBoxes!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
            
            OneTimeCodeBoxes(codeDict: $codeDict,
                             firstResponderIndex: $firstResponderIndex)
                .padding()
            
            Button(action: {}, label: {
                Text("Resend Code")
                    .underline()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.red)
                
                Spacer()
            })
            .padding()
            
            Spacer()
        }
        .padding(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
