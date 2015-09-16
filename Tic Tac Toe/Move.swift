//
//  Move.swift
//  Tic Tac Toe
//
//  Created by Neha Sharma on 9/15/15.
//  Copyright (c) 2015 Neha. All rights reserved.
//

import Foundation

class Move {
    var row : Int;
    var column : Int;
    var player : Player;
    
    init(row : Int, column : Int, player : Player) {
        self.row = row;
        self.column = column;
        self.player = player;
    }
}