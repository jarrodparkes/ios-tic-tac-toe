//
//  Game.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 1/1/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation

// MARK: - GameType

public enum GameType {
    case HumanVsHuman, HumanVsCom, ComVsCom
}

// MARK: - GameDelegate

public protocol GameDelegate {
    func didMoveAtPosition(position: CellPosition, type: PlayerType) -> Void
    func didEnd(board: Board, results: String) -> Void
}


// MARK: - Game

public class Game {
    
    // MARK: Properties
    
    public let board: Board
    public let gameType: GameType
    public let player1: Player
    public let player2: Player
    public var nextPlayer: Player? = nil
    public var delegate: GameDelegate? = nil
    
    // MARK: Initializers
    
    public init() {
        board = Board(boardWidth: 3)
        gameType = .HumanVsHuman
        player1 = HumanPlayer(board: board, type: .PlayerX)
        nextPlayer = player1
        player2 = HumanPlayer(board: board, type: .PlayerO)
    }
    
    public init(strategy1: StrategyType) {
        board = Board(boardWidth: 3)
        gameType = .HumanVsCom
        player1 = HumanPlayer(board: board, type: .PlayerX)
        player2 = AIPlayer(board: board, type: .PlayerO, strategy: strategy1)
        nextPlayer = player2
    }
    
    public init(strategy1: StrategyType, strategy2: StrategyType) {
        board = Board(boardWidth: 3)
        gameType = .ComVsCom
        player1 = AIPlayer(board: board, type: .PlayerX, strategy: strategy1)
        nextPlayer = player1 as? AIPlayer
        player2 = AIPlayer(board: board, type: .PlayerO, strategy: strategy2)
    }
    
    // MARK: Start Game
    
    public func startGame() {
        switch(gameType) {
        case .HumanVsHuman, .HumanVsCom:
            return
        case .ComVsCom:
            moveAIPlayer()
        }
    }
    
    // MARK: Move AIPlayer
    
    public func moveAIPlayer() {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            if let currentAIPlayer = self.nextPlayer as? AIPlayer {
                let changedPosition = currentAIPlayer.makeAIMove()
                self.delegate?.didMoveAtPosition(changedPosition, type: currentAIPlayer.type)
                switch(self.gameType) {
                case .HumanVsHuman:
                    return
                case .HumanVsCom:
                    self.checkEndGame()
                case .ComVsCom:
                    if currentAIPlayer.type == .PlayerX {
                        self.nextPlayer = self.player2
                    } else {
                        self.nextPlayer = self.player1
                    }
                    self.makeNextMove()
                }
            }
        }
    }
    
    // MARK: Move HumanPlayer
    
    public func moveHumanPlayer(playerType: PlayerType, position: CellPosition) {
        switch(gameType) {
        case .ComVsCom:
            return
        case .HumanVsCom:
            if playerType == .PlayerO {
                return
            } else {
                let human = player1 as! HumanPlayer
                let changedPosition = human.setCellAtPosition(position)
                delegate?.didMoveAtPosition(changedPosition, type: human.type)
                makeNextMove()
            }
        case .HumanVsHuman:
            if let currentPlayer = nextPlayer as? HumanPlayer {
                if currentPlayer.type == .PlayerX {
                    self.nextPlayer = self.player2
                } else {
                    self.nextPlayer = self.player1
                }
                let changedPosition = currentPlayer.setCellAtPosition(position)
                delegate?.didMoveAtPosition(changedPosition, type: currentPlayer.type)
                self.checkEndGame()
            }
        }
    }
    
    // MARK: Make Next Move
    
    public func makeNextMove() {
        if !board.gameOver {
            switch(gameType) {
            case .HumanVsHuman:
                return
            case .HumanVsCom:
                moveAIPlayer()
            case .ComVsCom:
                moveAIPlayer()
            }
        } else {
            endGame()
        }
    }
    
    // MARK: End Game
    
    public func checkEndGame() {
        if board.gameOver {
            endGame()
        }
    }
    
    public func endGame() {
        var results = ""
        switch(board.winner().1, gameType) {
        case (.Empty, _):
            results = "It's a draw!"
        case (_, .HumanVsHuman):
            results = (player1.type.value == board.winner().1) ? "Player1 wins!" : "Player2 wins!"
        case (_, .HumanVsCom):
            results = (player1.type.value == board.winner().1) ? "You win!" : "You lose!"
        case (_, .ComVsCom):
            results = (player1.type.value == board.winner().1) ? "COM1 wins!" : "COM2 wins!"
        }
        delegate?.didEnd(board, results: results)
    }
    
    // MARK: Reset Game
    
    public func reset() {
        board.clearBoard()
        switch(gameType) {
        case .HumanVsCom:
            nextPlayer = player2
        case .HumanVsHuman, .ComVsCom:
            nextPlayer = player1
        }
        startGame()
    }
}
