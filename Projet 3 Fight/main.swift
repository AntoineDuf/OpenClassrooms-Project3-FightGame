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

playerName1()
playerName2()
//var firstPlayerName: String = readLine()!
//
//if firstPlayerName.contains(" ") {
//        print("Space are forbidden.")
//} else if firstPlayerName.isEmpty {
//    print("You must enter a name.")
//}
//else {
//    print("hello \(firstPlayerName)!")
//}
//
//print("What is the name of the second player?")
//
//
//var secondPlayerName: String = readLine()!
//
//if secondPlayerName.contains(" ") {
//    print("les espace sont interdits")
//} else if secondPlayerName.isEmpty {
//    print("Il faut rentrer un nom")
//}
//else {
//    print("hello \(secondPlayerName)")
//}

//Présentation du choix des équipes
print("Now it's time to chose your character."
    + "\nBe carefull a character can be pick one time only")

print("1. \(Warrior.init().presentationCharacter)")
print("2. \(Paladin.init().presentationCharacter)")
print("3. \(Mage.init().presentationCharacter)")
print("4. \(Wizard.init().presentationCharacter)")
print("5. \(Priest.init().presentationCharacter)")
print("6. \(Thief.init().presentationCharacter)")


















