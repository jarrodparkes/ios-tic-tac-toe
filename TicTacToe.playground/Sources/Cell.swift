//
//  Cell.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 12/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

// MARK: - Cell

public struct Cell {
    
    // MARK: Properties
    
    public let position: CellPosition
    public var value: CellValue
    
    // MARK: Initializers
    
    public init(position: CellPosition) {
        self.position = position
        value = .Empty
    }
    
    public init(position: CellPosition, value: CellValue) {
        self.position = position
        self.value = value
    }
}

// MARK: - Cell: CustomStringConvertible

extension Cell: CustomStringConvertible {
    public var description: String {
        return "\(position.description) == \(value.description)"
    }
}

// MARK: - CellPosition

public struct CellPosition {
    public let r: Int
    public let c: Int
    
    public init(r: Int, c: Int) {
        self.r = r
        self.c = c
    }
}

// MARK: - CellPosition: CustomStringConvertible

extension CellPosition: CustomStringConvertible {
    public var description: String {
        return "(r: \(r), c: \(c))"
    }
}

// MARK: - CellValue

public enum CellValue {
    case Empty, Nought, Cross
}

// MARK: - CellValue: CustomStringConvertible

extension CellValue: CustomStringConvertible {
    public var description: String {
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