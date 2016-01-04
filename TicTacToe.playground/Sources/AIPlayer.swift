//
//  AIPlayer.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 1/1/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

// MARK: - AIPlayer: Player

public class AIPlayer: Player {
    
    // MARK: Properties
    
    public let strategy: StrategyType
    
    // MARK: Initializer
    
    public init(board: Board, type: PlayerType, strategy: StrategyType) {
        self.strategy = strategy
        super.init(board: board, type: type)
    }
    
    // MARK: Move
    
    public func makeAIMove() -> CellPosition {
        let bestPosition = strategy.determineBestPosition(board, forPlayer: self)
        board.setCell(bestPosition, value: type.value)
        return bestPosition
    }
}
