//
//  AIPlayer.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 1/1/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

// MARK: - AIPlayer: Player

class AIPlayer: Player {
    
    // MARK: Properties
    
    let strategy: StrategyType
    var bestPosition: CellPosition? = nil
    
    // MARK: Initializer
    
    init(board: Board, type: PlayerType, strategy: StrategyType) {
        self.strategy = strategy
        super.init(board: board, type: type)
    }
    
    // MARK: Move
    
    func makeAIMove() -> CellPosition {
        let bestPosition = strategy.determineBestPosition(board, forPlayer: self)
        board.setCell(bestPosition, value: type.value)
        return bestPosition
    }
}
