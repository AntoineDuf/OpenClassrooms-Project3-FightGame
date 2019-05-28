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
    var name = ""
    var team = [Character] ()
    private var playerList = [Player] ()
    var fighter = [Character] ()
    var target = [Character] ()
    var enemyPlayer = player1
    
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
    
    func enemy() {
        if self.number == 1 {
            enemyPlayer = player2
        } else {
            enemyPlayer = player1
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
        print("\(self.name) have on his team:")
        if self.team.count == 3{
            print("1: \(self.team[0].presentationWhithoutNumb())")
            print("2: \(self.team[1].presentationWhithoutNumb())")
            print("3: \(self.team[2].presentationWhithoutNumb())")
        }
        if self.team.count == 2{
            print("1: \(self.team[0].presentationWhithoutNumb())")
            print("2: \(self.team[1].presentationWhithoutNumb())")
        }
        if self.team.count == 1{
            print("1: \(self.team[0].presentationWhithoutNumb())")
        }
    }
    func showEnemyTeam() {
        if self.number == 1 {
            player2.showTeam()
        } else {
            player1.showTeam()
        }
    }
    func chooseFighter() {
        print("\(self.name) choose a fighter with taping is number")
        if let choice = readLine(){
            switch choice {
            case "1":
                fighter.insert(team[0], at: 0)
                print("You choose to attack with \(fighter[0].name) ")
            case "2":
                fighter.insert(team[1], at: 0)
                print("You choose to attack with \(fighter[0].name) ")
            case "3":
                fighter.insert(team[2], at: 0)
                print("You choose to attack with \(fighter[0].name) ")
            default:
                print("I don't understand, you must enter a number between 1 and 3.")
            }
        }
    }
    func chooseTarget() {
        print("\(self.name) choose a target with taping is number")
        if let choice = readLine(){
            switch choice {
            case "1":
                target.insert(enemyPlayer.team[0], at: 0)
                print("You choose to attack \(target[0].name) ")
            case "2":
                target.insert(enemyPlayer.team[1], at: 0)
                print("You choose to attack \(target[0].name) ")
            case "3":
                target.insert(enemyPlayer.team[2], at: 0)
                print("You choose to attack \(target[0].name) ")
            default:
                print("I don't understand, you must enter a number between 1 and 3.")
            }
        }
    }
    func attack() {
        target[0].pv = target[0].pv - fighter[0].weaponDmg
        print("\(self.name) attacked \(target[0].name) with \(fighter[0].name) and inflicted \(fighter[0].weaponDmg) damage points")
    }
    func fight() {
        print("\(self.name) it's your turn to play.")
        self.showTeam()
        self.showEnemyTeam()
        self.chooseFighter()
        self.chooseTarget()
        self.attack()
        self.checkLife()
    }
    func checkLife() {
        if self.team.count == 3 {
            if self.team[0].pv <= 0 {
                self.team.remove(at: 0)
            } else if self.team[1].pv <= 0 {
                self.team.remove(at: 1)
            } else if self.team[2].pv <= 0 {
                self.team.remove(at: 2)
            }
        } else if self.team.count == 2 {
            if self.team[0].pv <= 0 {
                self.team.remove(at: 0)
            } else if self.team[1].pv <= 0 {
                self.team.remove(at: 1)
            }
        } else if self.team.count == 1 {
            if self.team[0].pv <= 0 {
                self.team.removeAll()
            }            
        }
        if enemyPlayer.team.count == 3 {
            if enemyPlayer.team[0].pv <= 0 {
                enemyPlayer.team.remove(at: 0)
            } else if enemyPlayer.team[1].pv <= 0 {
                enemyPlayer.team.remove(at: 1)
            } else if enemyPlayer.team[2].pv <= 0 {
                enemyPlayer.team.remove(at: 2)
            }
        } else if enemyPlayer.team.count == 2 {
            if enemyPlayer.team[0].pv <= 0 {
                enemyPlayer.team.remove(at: 0)
            } else if enemyPlayer.team[1].pv <= 0 {
                enemyPlayer.team.remove(at: 1)
            }
        } else if enemyPlayer.team.count == 1 {
            if enemyPlayer.team[0].pv <= 0 {
                enemyPlayer.team.removeAll()
            }
        }
    }
}


