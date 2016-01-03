//
//  Constants.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 12/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

// MARK: - Constants

struct Constants {
    static let WinningPatterns: [[CellPosition]] = [
        [CellPosition(r: 0, c: 0), CellPosition(r: 0, c: 1), CellPosition(r: 0, c: 2)],
        [CellPosition(r: 1, c: 0), CellPosition(r: 1, c: 1), CellPosition(r: 1, c: 2)],
        [CellPosition(r: 2, c: 0), CellPosition(r: 2, c: 1), CellPosition(r: 2, c: 2)],
        [CellPosition(r: 0, c: 0), CellPosition(r: 1, c: 0), CellPosition(r: 2, c: 0)],
        [CellPosition(r: 0, c: 1), CellPosition(r: 1, c: 1), CellPosition(r: 2, c: 1)],
        [CellPosition(r: 0, c: 2), CellPosition(r: 1, c: 2), CellPosition(r: 2, c: 2)],
        [CellPosition(r: 0, c: 0), CellPosition(r: 1, c: 1), CellPosition(r: 2, c: 2)],
        [CellPosition(r: 2, c: 0), CellPosition(r: 1, c: 1), CellPosition(r: 0, c: 2)],
    ]
    
    static let ThreeCrossBonus = 100
    static let TwoCrossBonus = 10
    static let OneCrossBonus = 1
    
    static let ThreeNoughtBonus = -100
    static let TwoNoughtBonus = -10
    static let OneNoughtBonus = -1
    
    static let EmptySymbol = "⬜️"
    static let CrossSymbol = "❌"
    static let NoughtSymbol = "⭕️"
}
