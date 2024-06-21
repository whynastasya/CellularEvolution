//
//  CellView.swift
//  CellularEvolution
//
//  Created by nastasya on 19.06.2024.
//

import SwiftUI

struct CellView: View {
    let cell: Cell
    
    var body: some View {
        VStack {
            switch cell.state {
                case .alive:
                    aliveCellView()
                case .dead:
                    deadCellView()
                case .life:
                    lifeCellView()
            }
        }
    }
    
    private func aliveCellView() -> some View {
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
    
    private func deadCellView() -> some View {
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
    
    private func lifeCellView() -> some View {
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
    CellView(cell: .init(state: .alive))
}
