//
//  main.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

let stringOptional: String?

//Presentation du jeu et demande du nom du 1er joueur.
print("Welcome you are in the Fight game!!!"
    + "\nIt is a RPG game for 2 players.")

Player1()
Player2()

print("Now it's time to chose your character."
    + "\nBe carefull a character can be pick one time only")

Warrior().presentationCharacter()
Paladin().presentationCharacter()
Mage().presentationCharacter()
Wizard().presentationCharacter()
Priest().presentationCharacter()
Thief().presentationCharacter()
















