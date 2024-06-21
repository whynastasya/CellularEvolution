//
//  CellularEvolutionView.swift
//  CellularEvolution
//
//  Created by nastasya on 19.06.2024.
//

import SwiftUI
import UIKit

struct CellularEvolutionView<ViewModel: CellularEvolutionViewModel>: View {
    @StateObject private var viewModel: ViewModel
    @State private var shouldScrollToTop = false
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
//        NavigationView {
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
                .overlay(alignment: .bottom) {
                    PlusButton {
                        shouldScrollToTop = true
                    }
                }
            }
//            .navigationTitle("Клеточное наполнение")
//            .navigationBarTitleDisplayMode(.inline)
//        }
    }
}

#Preview {
    NavigationStack {
        CellularEvolutionView(viewModel: CellularEvolutionViewModelImpl())
    }
    .navigationTitle("Клеточное наполнение")
    .navigationBarTitleDisplayMode(.inline)
}

