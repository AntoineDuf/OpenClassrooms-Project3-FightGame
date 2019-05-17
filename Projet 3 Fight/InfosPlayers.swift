//
//  InfosPlayers.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 12/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//
import Foundation

internal class Player1 {
    private let number = 1
    internal var name = "Player 1"
    internal var team = [Character]()
    private func askName() {
        print("What is the name of the first player?")
        if let askName = readLine() {
            name = askName
        }
        if name.contains(" ") {
                print("Space are forbidden!")
                self.askName()
        }
        else if name.isEmpty {
                print("You must enter a name!")
                self.askName()
        }
        else {
            print("Hello \(self.name)!")
        }
    }
    init() {
        askName()
    }
}

internal class Player2 {
    private let number = 2
    internal var name = "Player 2"
    internal var team = [Character]()
    private func askName() {
        print("What is the name of the second player?")
        if let askName = readLine(){
            name = askName
        }
        if name.contains(" ") {
            print("Space are forbidden!")
            self.askName()
        }
        else if name.isEmpty {
            print("You must enter a name!")
            self.askName()
        }
        else {
            print("Hello \(self.name)!")
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
