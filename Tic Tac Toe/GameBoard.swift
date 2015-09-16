//
//  GameBoard.swift
//  Tic Tac Toe
//
//  Created by Neha Sharma on 9/12/15.
//  Copyright (c) 2015 Neha. All rights reserved.
//

import Foundation

class GameBoard {
    let boardSize = 3;
    var board: [[Player]];
    
    init() {
        board = [[Player.EMPTY, Player.EMPTY, Player.EMPTY], [Player.EMPTY, Player.EMPTY, Player.EMPTY], [Player.EMPTY, Player.EMPTY, Player.EMPTY]]
    }
    
    func clearBoard() {
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                board[i][j] = Player.EMPTY
            }
        }
    }
    
    func isBoardFull() -> Bool {
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if (board[i][j] == Player.EMPTY) {
                    return false;
                }
            }
        }
        return true;
    }
    
    func isGameOver() -> Bool {
        return getWinner() != Player.EMPTY || isBoardFull();
    }
    
    func getWinner() -> Player {
        var player = Player.EMPTY;
        
        // check rows
        for row in 0..<boardSize {
            player = board[row][0];
            for column in 0..<boardSize {
                if (board[row][column] != player) {
                    player = Player.EMPTY;
                    break;
                }
            }
            if (player != Player.EMPTY) {
                return player;
            }
        }
        
        // check columns
        for column in 0..<boardSize {
            player = board[0][column];
            for row in 0..<boardSize {
                if (board[row][column] != player) {
                    player = Player.EMPTY;
                    break;
                }
            }
            if (player != Player.EMPTY) {
                return player;
            }
        }
        
        // check left-right diagonal
        player = board[0][0];
        for var row = 0, column = 0; row < boardSize && column < boardSize; ++row, ++column {
            if (board[row][column] != player) {
                player = Player.EMPTY;
                break;
            }
        }
        if (player != Player.EMPTY) {
            return player;
        }
    
        
        
        // check right-left diagonal
        player = board[boardSize - 1][0];
        for var row = boardSize-1, column = 0; row >= 0 && column < boardSize; --row, ++column {
            if (board[row][column] != player) {
                player = Player.EMPTY;
                break;
            }
        }
        return player;
    }
    
    func isMovePossible(row : Int, column : Int) -> Bool {
        return board[row][column] == Player.EMPTY;
    }
    
    func playMove(move : Move) {
        board[move.row][move.column] = move.player;
    }
    
 }
