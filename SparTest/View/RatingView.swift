//
//  RatingView.swift
//  SparTest
//
//  Created by Антон Баскаков on 05.08.2024.
//

import SwiftUI

struct RatingView: View {
    var rating: Double
    
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundStyle(Color.yellow)
                .fontWeight(.semibold)
            Text(rating.formatted())
        }
        .font(.caption)
    }
}

#Preview {
    RatingView(rating: 4.99)
}
