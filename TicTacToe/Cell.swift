//
//  Cell.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 12/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

// MARK: - Cell

struct Cell {
    
    // MARK: Properties
    
    let position: CellPosition
    var value: CellValue
    
    // MARK: Initializers
    
    init(position: CellPosition) {
        self.position = position
        value = .Empty
    }
    
    init(position: CellPosition, value: CellValue) {
        self.position = position
        self.value = value
    }
}

// MARK: - Cell: CustomStringConvertible

extension Cell: CustomStringConvertible {
    var description: String {
        return "\(position.description) == \(value.description)"
    }
}

// MARK: - CellPosition

struct CellPosition {
    
    // MARK: Properties
    
    let r: Int
    let c: Int
    
    // MARK: Initializers
    
    init(r: Int, c: Int) {
        self.r = r
        self.c = c
    }
}

// MARK: - CellPosition: CustomStringConvertible

extension CellPosition: CustomStringConvertible {
    var description: String {
        return "(r: \(r), c: \(c))"
    }
}

// MARK: - CellValue

enum CellValue {
    case Empty, Nought, Cross
    
    // MARK: Properties
    
    var opposite: CellValue {
        switch(self) {
        case .Empty:
            return .Empty
        case .Nought:
            return .Nought
        case .Cross:
            return .Cross
        }
    }
}

// MARK: - CellValue: CustomStringConvertible

extension CellValue: CustomStringConvertible {
    var description: String {
        switch(self) {
        case .Empty:
            return " \(Constants.EmptySymbol) "
        case .Nought:
            return " \(Constants.NoughtSymbol) "
        case .Cross:
            return " \(Constants.CrossSymbol) "
        }
    }
}