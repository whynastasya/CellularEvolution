//
//  CellularEvolutionViewModel.swift
//  CellularEvolution
//
//  Created by nastasya on 21.06.2024.
//

import Combine

protocol CellularEvolutionViewModel: ObservableObject {
    
    var cells: [Cell] { get }
    var liveCellCount: Int { get }
    var deadCellCount: Int { get }
    
    func addCell()
}
