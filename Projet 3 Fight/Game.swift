//
//  Game.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 23/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

/**
 This class Game call the Player mecanics.
 The method of operation of the game is organize in this class.
 The flow of the game is initiate in this class.
 
 - Instantiate each players and their teams: -presentCharacter
                                             -createPlayerTeam
                                             -createEnemy
 
 - Turn by turn logic: -turnByTurn
 
 - Winning conditions evaluation and description: -checkVictory
                                                  -printNumberOfTurn
                                                  -winnerTeamAndLooserTeam
 */

class Game {
    var player1: Player
    var player2: Player
    var numberTurn = 0

    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        player1.setName()
        player2.setName()
        player2.verifySameName()
        createEnemy()
        presentCharacter()
        createPlayerTeam()
        turnByTurn()
        checkVictory()
        printNumberOfTurn()
        winnerTeamAndLooserTeam()
    }
    
    //This method present all the different chararcter to the players.
    private func presentCharacter() {
        print("Choisissez vos personnages."
            + "\nAttention un personnage peut être choisi une seule fois.")
        Warrior().presentation(number: 1)
        Paladin().presentation(number: 2)
        Mage().presentation(number: 3)
        Wizard().presentation(number: 4)
        Priest().presentation(number: 5)
        Thief().presentation(number: 6)
    }
    
    //This method call the creation of the team of each player.
    private func createPlayerTeam() {
        print("Il est maintenant temps de choisir vos équipes.")
        while player1.team.count < 3 && player2.team.count < 3{
            player1.setPlayerTeam()
            player2.setPlayerTeam()
        }
    }
    
    //This method create an enemy for each player.
    private func createEnemy() {
        player1.enemy()
        player2.enemy()
    }
    
    //This method is a loop who looping until one of the team have all this character KO.
    private func turnByTurn() {
        while !player1.checkTeamAlive() && !player2.checkTeamAlive() {
            numberTurn += 1
            player1.fight()
            if !player2.checkTeamAlive() && !player1.checkTeamAlive() {
                player2.fight()
            }
        }
    }
    
    //This method shows which team has win.
    private func checkVictory() {
        if player1.checkTeamAlive() {
            print("\(player2.name) gagne !!!")
            
        }
        else if player2.checkTeamAlive() {
            print("\(player1.name) gagne !!!")
        }
    }
    
    //This method shows in how many turns the game had a winner.
    private func printNumberOfTurn() {
        print("Le jeu s'est déroulé en \(numberTurn) tours.")
    }
    
    //This method shows which team is the winner and which is the looser and shows each team and their properties.
    private func winnerTeamAndLooserTeam() {
        var winner = player1
        var looser = player2
        if player1.checkTeamAlive() {
            winner = player2
            looser = player1
        }
        print("L'équipe gagnante est celle de \(winner.name) et est composée de:")
        var numberWinner = 1
        for i in 0..<winner.team.count {
            winner.team[i].presentation(number: numberWinner)
            numberWinner += 1
        }
        print("L'équipe perdante est celle de \(looser.name) et est composée de:")
        var numberLooser = 1
        for i in 0..<looser.team.count {
            looser.team[i].presentation(number: numberLooser)
            numberLooser += 1
        }
    }
}
