//
//  main.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Presentation du jeu et demande du nom du 1er joueur.
print("Welcome you are in the Fight game!!!"
    + "\nIt is a RPG game for 2 players.")

let player1 = Player(number: 1)
let player2 = Player(number: 2)

print("Now it's time to chose your character."
    + "\nBe carefull a character can be pick one time only")

Warrior().presentation()
Paladin().presentation()
Mage().presentation()
Wizard().presentation()
Priest().presentation()
Thief().presentation()

print("Now it's time to choose your team.")

Game(player1: player1, player2: player2).createPlayerTeam()















