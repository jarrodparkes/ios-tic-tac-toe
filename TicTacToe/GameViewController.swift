//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 1/1/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit

// MARK: - GameViewController: UIViewController

class GameViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var cell0: UIButton!
    @IBOutlet weak var cell1: UIButton!
    @IBOutlet weak var cell2: UIButton!
    @IBOutlet weak var cell3: UIButton!
    @IBOutlet weak var cell4: UIButton!
    @IBOutlet weak var cell5: UIButton!
    @IBOutlet weak var cell6: UIButton!
    @IBOutlet weak var cell7: UIButton!
    @IBOutlet weak var cell8: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    // MARK: Properties
    
    var game: Game!
    var buttonArray = [UIButton]()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButtonArray()
        initializeButtons()
        
        resetButton.enabled = false
        
        game.delegate = self
        game.startGame()
        
        if game.gameType == .ComVsCom {
            navigationController?.navigationBarHidden = true
        }
        if game.gameType == .HumanVsHuman {
            navigationController?.navigationBarHidden = false
        }
    }
    
    // MARK: Button Setup
    
    func createButtonArray() {
        buttonArray.append(cell0)
        buttonArray.append(cell1)
        buttonArray.append(cell2)
        buttonArray.append(cell3)
        buttonArray.append(cell4)
        buttonArray.append(cell5)
        buttonArray.append(cell6)
        buttonArray.append(cell7)
        buttonArray.append(cell8)
    }
    
    func initializeButtons() {
        for (index, cell) in game.board.cellArray().enumerate() {
            buttonArray[index].setTitle(cell.value.description, forState: UIControlState())
            buttonArray[index].enabled = true
        }
    }
    
    // MARK: Actions
    
    @IBAction func resetGame(sender: AnyObject) {
        game.reset()
        initializeButtons()
    }
    
    @IBAction func selectCell(cell: UIButton) {
        if let human = game.player1 as? HumanPlayer where !game.board.gameOver {
            let position = CellPosition(r: cell.tag / 3, c: cell.tag % 3)
            game.moveHumanPlayer(human.type, position: position)
        }
    }
}

// MARK: - GameViewController: GameDelegate

extension GameViewController: GameDelegate {
    
    func didMoveAtPosition(position: CellPosition, type: PlayerType) {
        let button = buttonArray[position.r * 3 + position.c]
        button.setTitle(game.board.cellAtPosition(position).value.description, forState: UIControlState())
        button.enabled = false
    }
    
    func didEnd(board: Board, results: String) {
        let alertController = UIAlertController(title: "Game Over", message: results, preferredStyle: .Alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .Cancel) { action in
            if self.game.gameType == .ComVsCom {
                self.navigationController?.navigationBarHidden = false
            }
            self.resetButton.enabled = true
        }
        alertController.addAction(dismissAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
}
