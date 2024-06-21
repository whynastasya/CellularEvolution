//
//  CellularEvolutionApp.swift
//  CellularEvolution
//
//  Created by nastasya on 19.06.2024.
//

import SwiftUI

@main
struct CellularEvolutionApp: App {
    
    private let cellularEvolutionAssembly = CellularEvolutionAssembly()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                cellularEvolutionScreen
                    .navigationTitle("Клеточное наполнение")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    private var cellularEvolutionScreen: some View {
        cellularEvolutionAssembly.assemble()
    }
}

final class CellularEvolutionAssembly {
    
    func assemble() -> some View {
        let viewModel = CellularEvolutionViewModelImpl()
        return CellularEvolutionView(viewModel: viewModel)
    }
}
