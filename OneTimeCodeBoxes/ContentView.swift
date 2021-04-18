//
//  ContentView.swift
//  OneTimeCodeBoxes
//
//  Created by HikingWithSwift on 2021-04-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Hello, OneTimeCodeBoxes!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
            
            TextField("To be replaced", text: .constant(""))
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .foregroundColor(.secondary))
                .frame(height: 60)
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
