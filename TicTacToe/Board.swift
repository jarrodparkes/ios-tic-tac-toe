//
//  Board.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 12/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

// MARK: - Board

class Board {
    
    // MARK: Properties
    
    var cells: [[Cell]]
    let boardWidth: Int
    
    var score: Int {
        var totalScore = 0
        for pattern in Constants.WinningPatterns {
            // count the number of Empty, Cross, and Nought in a row
            var counts = [
                CellValue.Empty: 0,
                CellValue.Cross: 0,
                CellValue.Nought: 0
            ]
            for position in pattern {
                counts[cells[position.r][position.c].value]! += 1
            }
            // calculate score based on counts
            totalScore += calculateScoreForRow(counts)
        }
        return totalScore
    }
    
    var emptyCellPositions: [CellPosition] {
        var positions = [CellPosition]()
        // flatten 2D array
        let _ = cells.flatMap {
            // look over flattened array
            $0.map {
                if $0.value == CellValue.Empty {
                    positions.append($0.position)
                }
            }
        }
        return positions
    }
    
    var gameOver: Bool {
        return winner().0 || emptyCellPositions.count == 0
    }
    
    // MARK: Initializers
    
    init(boardWidth: Int) {
        self.boardWidth = boardWidth
        cells = [[Cell]]()
        for r in 0...boardWidth-1 {
            var row = [Cell]()
            for c in 0...boardWidth-1 {
                row.append(Cell(position: CellPosition(r: r, c: c)))
            }
            cells.append(row)
        }
    }
    
    init(board: Board) {
        cells = board.cells
        boardWidth = board.boardWidth
    }
    
    // MARK: Generator
    
    func boardAfterMove(position: CellPosition, newValue: CellValue) -> Board {
        let nextBoard = Board(board: self)
        nextBoard.cells[position.r][position.c] = Cell(position: position, value: newValue)
        return nextBoard
    }
    
    // MARK: Score for Row
    
    private func calculateScoreForRow(counts: [CellValue: Int]) -> Int {
        var score = 0
        switch(counts[.Cross]!, counts[.Empty]!) {
        case (3, 0):
            score += Constants.ThreeCrossBonus
        case (2, 1):
            score += Constants.TwoCrossBonus
        case (1, 2):
            score += Constants.OneCrossBonus
        default:
            score *= 1
        }
        switch(counts[.Nought]!, counts[.Empty]!) {
        case (3, 0):
            score += Constants.ThreeNoughtBonus
        case (2, 1):
            score += Constants.TwoNoughtBonus
        case (1, 2):
            score += Constants.OneNoughtBonus
        default:
            score *= 1
        }
        return score
    }
    
    // MARK: Mutators
    
    func setCell(position: CellPosition, value: CellValue) {
        if cells[position.r][position.c].value == .Empty {
            cells[position.r][position.c].value = value
        } else {
            print("cell already taken")
        }
    }
    
    func clearBoard() {
        cells = [[Cell]]()
        for r in 0...boardWidth-1 {
            var row = [Cell]()
            for c in 0...boardWidth-1 {
                row.append(Cell(position: CellPosition(r: r, c: c)))
            }
            cells.append(row)
        }
    }
    
    func cellArray() -> [Cell] {
        return cells.flatMap { $0 }
    }
    
    func cellAtPosition(position: CellPosition) -> Cell {
        return cells[position.r][position.c]
    }
    
    func winner() -> (Bool, CellValue) {
        var win = false
        var winnerType = CellValue.Empty
        for pattern in Constants.WinningPatterns {
            let cell = cells[pattern[0].r][pattern[0].c]
            if cell.value == .Empty {
                continue
            }
            
            if cells[pattern[0].r][pattern[0].c].value == cells[pattern[1].r][pattern[1].c].value && cells[pattern[1].r][pattern[1].c].value == cells[pattern[2].r][pattern[2].c].value {
                winnerType = cells[pattern[0].r][pattern[0].c].value
                win = true
                break
            }
        }
        return (win, winnerType)
    }
}

// MARK: - Board: CustomStringConvertible

extension Board: CustomStringConvertible {
    var description: String {
        var finalStr = ""
        for r in 0...boardWidth-1 {
            for c in 0...boardWidth-1 {
                finalStr += cells[r][c].value.description
            }
            finalStr += "\n"
        }
        return finalStr
    }
}