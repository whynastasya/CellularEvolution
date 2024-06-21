//
//  LifeCell.swift
//  CellularEvolution
//
//  Created by nastasya on 21.06.2024.
//

import SwiftUI

struct LifeCell: View {
    var body: some View {
        HStack {
            Image("octopus")
                .resizable()
                .frame(width: 30, height: 30)
            Text("Жизнь")
                .foregroundColor(.white)
                .font(.title)
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.clear)
                .background(AnimatedGradientView(startColors: [.blue, .purple], endColors: [.orange, .pink]).mask(RoundedRectangle(cornerRadius: 10)))
        )
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}

#Preview {
    LifeCell()
}
