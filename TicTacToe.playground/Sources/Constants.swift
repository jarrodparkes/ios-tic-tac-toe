//
//  Constants.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 12/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

// MARK: - Constants

public struct Constants {
    public static let WinningPatterns: [[CellPosition]] = [
        [CellPosition(r: 0, c: 0), CellPosition(r: 0, c: 1), CellPosition(r: 0, c: 2)],
        [CellPosition(r: 1, c: 0), CellPosition(r: 1, c: 1), CellPosition(r: 1, c: 2)],
        [CellPosition(r: 2, c: 0), CellPosition(r: 2, c: 1), CellPosition(r: 2, c: 2)],
        [CellPosition(r: 0, c: 0), CellPosition(r: 1, c: 0), CellPosition(r: 2, c: 0)],
        [CellPosition(r: 0, c: 1), CellPosition(r: 1, c: 1), CellPosition(r: 2, c: 1)],
        [CellPosition(r: 0, c: 2), CellPosition(r: 1, c: 2), CellPosition(r: 2, c: 2)],
        [CellPosition(r: 0, c: 0), CellPosition(r: 1, c: 1), CellPosition(r: 2, c: 2)],
        [CellPosition(r: 2, c: 0), CellPosition(r: 1, c: 1), CellPosition(r: 0, c: 2)],
    ]
    
    public static let ThreeCrossBonus = 100
    public static let TwoCrossBonus = 10
    public static let OneCrossBonus = 1
    
    public static let ThreeNoughtBonus = -100
    public static let TwoNoughtBonus = -10
    public static let OneNoughtBonus = -1
    
    public static let EmptySymbol = "⬜️"
    public static let CrossSymbol = "❌"
    public static let NoughtSymbol = "⭕️"
}
