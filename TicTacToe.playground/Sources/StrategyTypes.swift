//
//  StrategyTypes.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 1/1/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation

// MARK: - StrategyType

public protocol StrategyType {
    func determineBestPosition(board: Board, forPlayer: Player) -> CellPosition
}

// MARK: - PickRandomStrategy: StrategyType

public class RandomStrategy: StrategyType {
    
    public init() {}
    
    public func determineBestPosition(board: Board, forPlayer: Player) -> CellPosition {
        let availableCells = board.emptyCellPositions
        let randomIndex = Int(arc4random_uniform(UInt32(availableCells.count)))
        return availableCells[randomIndex]
    }
}

// MARK: - RuleBasedStrategy: StrategyType

public class RuleBasedStrategy: StrategyType {
    
    public init() {}
    
    public func determineBestPosition(board: Board, forPlayer: Player) -> CellPosition {
        // middle
        let middleCell = board.cellAtPosition(CellPosition(r: 1, c: 1))
        // corners
        let cornerCells = [board.cellAtPosition(CellPosition(r: 0, c: 0)), board.cellAtPosition(CellPosition(r: 0, c: 2)), board.cellAtPosition(CellPosition(r: 2, c: 0)), board.cellAtPosition(CellPosition(r: 2, c: 2))]
        let emptyCorners = cornerCells.filter { $0.value == CellValue.Empty }
        // edges
        let edgeCells = [board.cellAtPosition(CellPosition(r: 0, c: 1)), board.cellAtPosition(CellPosition(r: 1, c: 0)), board.cellAtPosition(CellPosition(r: 1, c: 2)), board.cellAtPosition(CellPosition(r: 2, c: 1))]
        let emptyEdges = edgeCells.filter { $0.value == CellValue.Empty }
        // try the middle, then the corners, then the edges
        if middleCell.value == .Empty {
            return middleCell.position
        } else if emptyCorners.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emptyCorners.count)))
            return emptyCorners[randomIndex].position
        } else {
            let randomIndex = Int(arc4random_uniform(UInt32(emptyEdges.count)))
            return emptyEdges[randomIndex].position
        }
    }
}

// MARK: - MinimaxStrategy: StrategyType

public class MinimaxStrategy: StrategyType {
    
    public init() {}
    
    public func determineBestPosition(board: Board, forPlayer: Player) -> CellPosition {
        return miniMax(board, depth: 2, alpha: Int.min, beta: Int.max, playerType: forPlayer.type).1!
    }
    
    private func miniMax(tempBoard: Board, depth: Int, var alpha: Int, var beta: Int, playerType: PlayerType) -> (Int, CellPosition?) {
        
        if tempBoard.gameOver || depth == 0 {
            return (tempBoard.score, nil)
        }
        
        // playerX is trying to maximize, therefore we initialize to "-infinity" and begin looking for higher scores
        // playerO is trying to minimize, therefore we initialize to "+infinity" and begin looking for lower scores
        var bestScore = (playerType == .PlayerX) ? Int.min : Int.max
        var bestPosition: CellPosition? = nil
        
        for position in tempBoard.emptyCellPositions {
            
            let nextBoard = tempBoard.boardAfterMove(position, newValue: playerType.value)
            
            if playerType == .PlayerX {
                let result = miniMax(nextBoard, depth: depth-1, alpha: alpha, beta: beta, playerType: playerType.oppositePlayer)
                if result.0 > bestScore {
                    bestScore = result.0
                    bestPosition = position
                }
                alpha = max(alpha, result.0)
                if beta <= alpha {
                    break
                }
            } else {
                let result = miniMax(nextBoard, depth: depth-1, alpha: alpha, beta: beta, playerType: playerType.oppositePlayer)
                if result.0 < bestScore {
                    bestScore = result.0
                    bestPosition = position
                }
                beta = min(beta, result.0)
                if beta <= alpha {
                    break
                }
            }
        }
        
        return (bestScore, bestPosition)
    }
}