//
//  MenuViewController.swift
//  TicTacToe
//
//  Created by Jarrod Parkes on 12/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - MenuViewController: UIViewController

class MenuViewController: UIViewController {
        
    // MARK: - Life Cycle

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier, let settingsViewController = segue.destinationViewController as? SettingsViewController where identifier == "humanCom" {
            settingsViewController.hideExtraControls = true
        }
        if let identifier = segue.identifier, let gameViewController = segue.destinationViewController as? GameViewController where identifier == "play" {
            gameViewController.game = Game()
        }
    }
}