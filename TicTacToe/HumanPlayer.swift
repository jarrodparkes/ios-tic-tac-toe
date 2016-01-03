//
//  HumanPlayer.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 1/1/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

// MARK: - HumanPlayer: Player

class HumanPlayer: Player {
    
    // MARK: Set Cell
    
    func setCellAtPosition(position: CellPosition) -> CellPosition {
        board.setCell(position, value: type.value)
        return position        
    }
}