//
//  CellularEvolutionView.swift
//  CellularEvolution
//
//  Created by nastasya on 19.06.2024.
//

import SwiftUI
import UIKit

struct CellularEvolutionView: View {
    @StateObject private var viewModel = CellularEvolutionViewModel()
    @State private var shouldScrollToTop = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.cells) { cell in
                                CellView(cell: cell)
                                    .transition(.scale)
                            }
                            .animation(.default, value: viewModel.cells)
                        }
                        .scrollTargetLayout()
                    }
                    .scrollIndicators(.never)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    .onChange(of: shouldScrollToTop) {
                        if shouldScrollToTop {
                            if let cellID = viewModel.cells.first?.id {
                                withAnimation(.default) {
                                    proxy.scrollTo(cellID, anchor: .top)
                                }
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                withAnimation {
                                    viewModel.addCell()
                                }
                                shouldScrollToTop = false
                            }
                        }
                    }
                }
                
                PlusButton {
                    shouldScrollToTop = true
                }
            }
            .navigationTitle("Клеточное наполнение")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CellularEvolutionView()
}

