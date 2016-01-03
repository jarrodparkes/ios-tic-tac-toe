//
//  Player.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 12/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

// MARK: - PlayerType

public enum PlayerType {
    case PlayerX, PlayerO
    
    // MARK: Properties
    
    public var oppositePlayer: PlayerType {
        switch(self) {
        case .PlayerX:
            return .PlayerO
        case .PlayerO:
            return .PlayerX
        }
    }
    
    public var value: CellValue {
        switch(self) {
        case .PlayerX:
            return .Cross
        case .PlayerO:
            return .Nought
        }
    }
}

// MARK: - Player

public class Player {
    
    // MARK: Properties
    
    public var board: Board
    public var type: PlayerType
    
    // Initializers
    
    public init(board: Board, type: PlayerType) {
        self.board = board
        self.type = type
    }
}