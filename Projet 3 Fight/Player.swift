//
//  Player.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 19/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

class Player {
    private let number: Int
    private var name = ""
    var team = [Character]()
    private var playerList = [Player] ()
    
    init(number: Int) {
        self.number = number
        self.setName()
    }
    private func setName() {
        print("What is the name of the \(number) player?")
        if let name = readLine() {
            self.name = name
        }
        if name.contains(" ") {
            print("Space are forbidden!")
            self.setName()
        }
        else if name.isEmpty {
            print("You must enter a name!")
            self.setName()
        }
        else {
            print("Hello \(self.name)!")
        }
    }
    func playerTeam() {
        print("\(self.name) it's your turn to choose. Tap the number attached to the character you choose.")
        if let choice = readLine(){
            switch choice {
            case "1":
                if verifyAvailability(numberAvailability: 1) {
                    self.team.append(Warrior())
                }
            case "2":
                if verifyAvailability(numberAvailability: 2) {
                    self.team.append(Paladin())
                }
            case "3":
                if verifyAvailability(numberAvailability: 3) {
                    self.team.append(Mage())
                }
            case "4":
                if verifyAvailability(numberAvailability: 4) {
                    self.team.append(Wizard())
                }
            case "5":
                if verifyAvailability(numberAvailability: 5) {
                    self.team.append(Priest())
                }
            case "6":
                if verifyAvailability(numberAvailability: 6) {
                    self.team.append(Thief())
                }
            default:
                print("You must enter a number between 1 to 6.")
                playerTeam()            }
        }
    }
    private func removeCharacter(forKey: Int) {
        dictCharacter.removeValue(forKey: forKey)
    }
    
    private func verifyAvailability(numberAvailability: Int) -> Bool {
        if dictCharacter[numberAvailability] == nil {
            print ("This character have been already choose.")
            playerTeam()
            return false
        } else {
            print ("This character have been add to your team.")
            removeCharacter(forKey: numberAvailability)
            return true
        }
    }
    func showTeam() {
        print("\(self.name) you have in your team:")            
        print("\n\(self.team[0].presentationWhithoutNumb())"
            +   "\n\(self.team[1].presentationWhithoutNumb())"
            +   "\n\(self.team[2].presentationWhithoutNumb())"
        )
    }
}


