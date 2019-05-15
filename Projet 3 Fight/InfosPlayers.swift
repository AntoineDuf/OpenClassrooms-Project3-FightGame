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
    private func askName() {
        print("What is the name of the first player?")
        if let askName = readLine(){
            namePlayer = askName
        }
        if namePlayer.contains(" ") {
                print("Space are forbidden!")
                self.askName()
        }
        else if namePlayer.isEmpty {
                print("You must enter a name!")
                self.askName()
        }
        else {
            print("Hello \(self.namePlayer)!")
        }
    }
    init() {
        askName()
    }
}

class Player2 {
    let numberPlayer = 2
    var namePlayer = "Player 2"
    var teamPlayer = [Character]()
    private func askName() {
        print("What is the name of the second player?")
        if let askName = readLine(){
            namePlayer = askName
        }
        if namePlayer.contains(" ") {
            print("Space are forbidden!")
            self.askName()
        }
        else if namePlayer.isEmpty {
            print("You must enter a name!")
            self.askName()
        }
        else {
            print("Hello \(self.namePlayer)!")
        }
    }
    init() {
        askName()
    }
}

//
//func playerName1() {
//    print("What is the name of the first player?")
//    if let askName = readLine(){
//        Player1.init().namePlayer = askName
//    }
//}
//
//func playerName2() {
//    print("What is the name of the second player?")
//    if let playerName = readLine(){
//        Player2.init().namePlayer = playerName
//    }
//}
