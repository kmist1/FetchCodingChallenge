//
//  InstructionView.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/9/24.
//

import SwiftUI

struct InstructionView: View {
    let instruction: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions:")
                .font(.caption)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            Text(instruction)
                .font(.caption2)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    InstructionView(instruction: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.")
}
