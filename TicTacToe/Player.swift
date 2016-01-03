//
//  Player.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 12/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

// MARK: - PlayerType

enum PlayerType {
    case PlayerX, PlayerO
    
    // MARK: Properties
    
    var oppositePlayer: PlayerType {
        switch(self) {
        case .PlayerX:
            return .PlayerO
        case .PlayerO:
            return .PlayerX
        }
    }
    
    var value: CellValue {
        switch(self) {
        case .PlayerX:
            return .Cross
        case .PlayerO:
            return .Nought
        }
    }
}

// MARK: - Player

class Player {
    
    // MARK: Properties
    
    var board: Board
    var type: PlayerType
    
    // Initializers
    
    init(board: Board, type: PlayerType) {
        self.board = board
        self.type = type
    }
}