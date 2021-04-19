//
//  OneTimeCodeBoxes.swift
//  OneTimeCodeBoxes
//
//  Created by HikingWithSwift on 2021-04-17.
//

import SwiftUI

struct OneTimeCodeBoxes: View {
    
    @Binding var codeDict: [Int: String]
    @Binding var firstResponderIndex: Int
    var onCommit: (()->Void)?
    
    var body: some View {
        HStack {
            ForEach(0..<codeDict.count) { i in
                OneTimeCodeInput(
                    index: i,
                    codeDict: $codeDict,
                    firstResponderIndex: $firstResponderIndex,
                    onCommit: onCommit
                )
                .aspectRatio(1, contentMode: .fit)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.secondary))
            }
        }
    }
}

struct OneTimeCodeBoxes_Previews: PreviewProvider {
    static var previews: some View {
        OneTimeCodeBoxes(codeDict: .constant([0: "", 1: "", 2: "", 3: ""]),
                         firstResponderIndex: .constant(0))
            .padding()
            .previewLayout(.sizeThatFits)
        
        OneTimeCodeBoxes(codeDict: .constant([0: "", 1: "", 2: ""]),
                         firstResponderIndex: .constant(0))
            .preferredColorScheme(.dark)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
