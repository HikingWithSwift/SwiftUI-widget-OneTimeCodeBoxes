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
    
    var code: String {
        codeDict.sorted(by: { $0.key < $1.key }).map(\.value).joined()
    }
    
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Hello, OneTimeCodeBoxes!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
            
            OneTimeCodeBoxes(codeDict: $codeDict,
                             onCommit: {
                                print("onCommit", code)
                             })
                .onChange(of: codeDict, perform: { _ in })
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
