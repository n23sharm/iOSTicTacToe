//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Neha Sharma on 9/12/15.
//  Copyright (c) 2015 Neha. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var cell00: UIButton?
    @IBOutlet weak var cell01: UIButton?
    @IBOutlet weak var cell02: UIButton?
    @IBOutlet weak var cell10: UIButton?
    @IBOutlet weak var cell11: UIButton?
    @IBOutlet weak var cell12: UIButton?
    @IBOutlet weak var cell20: UIButton?
    @IBOutlet weak var cell21: UIButton?
    @IBOutlet weak var cell22: UIButton?
    
    var currentPlayer : Player?
    var gameBoard : GameBoard?
    var cellButtons : [UIButton?]?
    
    let rowMap : [Int] = [0, 0, 0, 1, 1, 1, 2, 2, 2]
    let columnMap : [Int] = [0, 1, 2, 0, 1, 2, 0, 1, 2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer = Player.CROSS;
        gameBoard = GameBoard();
        cellButtons = [cell00, cell01, cell02, cell10, cell11, cell12, cell20, cell21, cell22]
    }
    
    @IBAction func cellTapped(sender: UIButton) {
        let tag = sender.tag;
        let row = rowMap[tag];
        let column = columnMap[tag];
        
        if (gameBoard!.isMovePossible(row, column: column)) {
            playMove(row, column: column, button: sender);
        }
    }
    
    func playMove(row : Int, column : Int, button : UIButton) {
        let move = Move(row: row, column: column, player: currentPlayer!);
        // update game board model
        gameBoard!.playMove(move);
        // update UI label
        button.setTitle(currentPlayer!.rawValue, forState: UIControlState.Normal)
        
        if (gameBoard!.isGameOver()) {
            let winner = gameBoard!.getWinner();
            let alert = UIAlertController(title: "Game Over", message: String(format:"%@ won!", winner.rawValue), preferredStyle: UIAlertControllerStyle.Alert)
            let restartAction: UIAlertAction = UIAlertAction(title: "Play again", style: .Default) { action -> Void in
                self.restartGame();
            }
            alert.addAction(restartAction);
            self.presentViewController(alert, animated: true, completion: nil);
        } else {
            // switch current player
            currentPlayer = currentPlayer == Player.CROSS ? Player.CIRCLE : Player.CROSS;
        }
    }
    
    func restartGame() {
        gameBoard!.clearBoard();
        for cell in cellButtons! {
            cell!.setTitle("", forState: UIControlState.Normal)
        }
        currentPlayer = Player.CROSS;
        
    }
    
}

