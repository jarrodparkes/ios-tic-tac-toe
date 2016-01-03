//
//  SettingsViewController.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 1/1/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit

// MARK: - SettingsViewController: UIViewController

class SettingsViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var com1StrategyControl: UISegmentedControl!
    @IBOutlet weak var com2StrategyLabel: UILabel!
    @IBOutlet weak var com2StrategyControl: UISegmentedControl!
    
    // MARK: Properties
    
    var hideExtraControls = false
    let stratagies: [StrategyType] = [
        MinimaxStrategy(),
        RuleBasedStrategy(),
        RandomStrategy()
    ]
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = false
        if hideExtraControls {
            com2StrategyLabel.hidden = true
            com2StrategyControl.hidden = true
        }
    }
    
    // MARK: Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier, let gameViewController = segue.destinationViewController as? GameViewController where identifier == "play" {
            if com2StrategyControl.hidden == true {
                gameViewController.game = Game(strategy1: stratagies[com1StrategyControl.selectedSegmentIndex])
            } else {
                gameViewController.game = Game(strategy1: stratagies[com1StrategyControl.selectedSegmentIndex], strategy2: stratagies[com2StrategyControl.selectedSegmentIndex])
            }
        }
    }
}