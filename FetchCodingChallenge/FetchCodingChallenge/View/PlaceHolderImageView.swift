//
//  PlaceHolderImageView.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/9/24.
//

import SwiftUI

struct PlaceHolderImageView: View {
    var body: some View {
        Image("PlaceHolder")
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    PlaceHolderImageView()
}
