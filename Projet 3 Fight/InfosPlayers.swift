//
//  InfosPlayers.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 12/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//
import Foundation

class Player1 {
    let numberPlayer = 1
    var namePlayer = "Player 1"
    var teamPlayer = [Character]()
    }



class Player2 {
    let numberPlayer = 2
    var namePlayer = "Player 2"
    var teamPlayer = [Character]()
}

func playerName1() {
    print("What is the name of the first player?")
    if let playerName = readLine(){
        Player1.init().namePlayer = playerName
    }
}

func playerName2() {
    print("What is the name of the second player?")
    if let playerName = readLine(){
        Player2.init().namePlayer = playerName
    }
}
