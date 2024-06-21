//
//  Cell.swift
//  CellularEvolution
//
//  Created by nastasya on 19.06.2024.
//

import Foundation

struct Cell: Identifiable, Equatable {
    let id = UUID()
    var state: CellState
}

enum CellState {
    case alive
    case dead
    case life
}
