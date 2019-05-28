//
//  Game.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 23/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

class Game {
    var player1: Player
    var player2: Player
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        presentCharacter()
        createPlayerTeam()
        createEnemy()
        turnByTurn()
        checkVictory()
    }
    private func createPlayerTeam() {
        print("Now it's time to choose your team.")
        while player1.team.count < 3 && player2.team.count < 3{
            player1.playerTeam()
            player2.playerTeam()
        }
    }
    private func createEnemy() {
        player1.enemy()
        player2.enemy()
    }
    private func presentCharacter() {
        print("Now it's time to choose your character."
            + "\nBe carefull a character can be pick one time only")
        
        Warrior().presentation()
        Paladin().presentation()
        Mage().presentation()
        Wizard().presentation()
        Priest().presentation()
        Thief().presentation()
    }
    private func turnByTurn(){
        while player1.team.count > 0 && player2.team.count > 0 {
            player1.fight()
            if player2.team.count > 0 && player1.team.count > 0 {
                player2.fight()
            }
        }
    }
    private func checkVictory() {
        if player1.team.isEmpty {
            print("\(player2.name) win!!!")
        }
        else if player2.team.isEmpty {
            print("\(player1.name) win!!!")
        }
    }
}
