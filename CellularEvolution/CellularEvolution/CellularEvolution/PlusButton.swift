//
//  PlusButton.swift
//  CellularEvolution
//
//  Created by nastasya on 21.06.2024.
//

import SwiftUI

struct PlusButton: View {
    
    private let action: () -> ()
    
    init(action: @escaping () -> ()) {
        self.action = action
    }
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: action) {
                Image(systemName: "plus")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .padding(30)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Circle())
                    .shadow(radius: 10)
            }
        }
        .padding()
    }
}

#Preview {
    PlusButton(action: {})
}
