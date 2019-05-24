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
            case "1": self.team.append(Warrior())
            case "2": self.team.append(Paladin())
            case "3": self.team.append(Mage())
            case "4": self.team.append(Wizard())
            case "5": self.team.append(Priest())
            case "6": self.team.append(Thief())
            default:
                print("You must enter a name between 1 to 6.")
            }
        }
    }
}


