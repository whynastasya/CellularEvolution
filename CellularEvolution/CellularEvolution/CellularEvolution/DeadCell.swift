//
//  DeadCell.swift
//  CellularEvolution
//
//  Created by nastasya on 21.06.2024.
//

import SwiftUI

struct DeadCell: View {
    var body: some View {
        HStack {
            Image("skull_and_crossbones")
                .resizable()
                .frame(width: 30, height: 30)
            Text("Мёртвая клетка")
                .foregroundColor(.white)
                .font(.title)
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.clear)
                .background(AnimatedGradientView(startColors: [.black, .gray], endColors: [.blue, .black]).mask(RoundedRectangle(cornerRadius: 10)))
        )
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}

#Preview {
    DeadCell()
}
