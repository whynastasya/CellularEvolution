//
//  AliveCell.swift
//  SellerCenter
//
//  Created by nastasya on 21.06.2024.
//

import SwiftUI

struct AliveCell: View {
    var body: some View {
        HStack {
            Image("leaves")
                .resizable()
                .frame(width: 30, height: 30)
            Text("Живая клетка")
                .foregroundColor(.white)
                .font(.title)
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.clear)
                .background(AnimatedGradientView().mask(RoundedRectangle(cornerRadius: 10)))
        )
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}

#Preview {
    AliveCell()
}
