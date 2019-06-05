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
    var team = [Character]()
    private var playerList = [Player]()
    var fighter = [Character]()
    var target = [Character]()
    var enemyPlayer = player1
    
    init(number: Int) {
        self.number = number
        self.setName()
    }
    
    private func setName() {
        print("Quel est le nom du joueur \(number) ?")
        if let name = readLine() {
            self.name = name
        }
        if name.contains(" ") {
            print("Les espaces sont interdits !")
            self.setName()
        }
        else if name.isEmpty {
            print("Vous devez rentrer un nom !")
            self.setName()
        }
            //        else if player2.name.contains(player1.name) {
            //            print("Vous ne pouvez pas avoir le même nom que votre ennemi.")
            //            self.setName()
            //        }
        else {
            print("Bonjour \(self.name) !")
        }
    }
    
    func playerTeam() {
        print("\(self.name) c'est à votre tour de choisir. Tapez le nombre attaché au personnage pour le choisir.")
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
                print("Vous devez renter un nombre entre 1 et 6.")
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
            print ("Ce personnage a déjà été choisi.")
            playerTeam()
            return false
        } else {
            print ("Ce personnage a été rajouté à votre équipe.")
            removeCharacter(forKey: numberAvailability)
            return true
        }
    }
    
    private func showTeam() {
        print("\(self.name) a dans son équipe:")
        var numb = 1
        for i in 0..<self.team.count {
            print("\(numb).")
            print(" \(self.team[i].presentationWhithoutNumb())")
            numb += 1
        }
    }
    
    private func showEnemyTeam() {
        if self.number == 1 {
            player2.showTeam()
        } else {
            player1.showTeam()
        }
    }
    
    private func chooseFighter() {
        print("\(self.name) choisissez votre combattant en tapant son numéro.")
        if let choice = readLine() {
            switch choice {
            case "1":
                if team[0].pv <= 0 {
                    print("Vous ne pouvez pas choisir un combattant KO.")
                    chooseFighter()
                } else {
                    fighter.insert(team[0], at: 0)
                    print("Vous avez choisi d'attaquer avec \(fighter[0].name) ")
                }
            case "2":
                if team[1].pv <= 0 {
                    print("Vous ne pouvez pas choisir un combattant KO.")
                    chooseFighter()
                } else {
                    fighter.insert(team[1], at: 0)
                    print("Vous avez choisi d'attaquer avec \(fighter[0].name) ")
                }
            case "3":
                if team[2].pv <= 0 {
                    print("Vous ne pouvez pas choisir un combattant KO.")
                    chooseFighter()
                } else {
                    fighter.insert(team[2], at: 0)
                    print("Vous avez choisi d'attaquer avec \(fighter[0].name) ")
                }
            default:
                print("Vous devez renter un nombre entre 1 et 3.")
                chooseFighter()
            }
        }
    }
    
    private func chooseTarget() {
        print("\(self.name) Choisissez une cible en tapant son numéro.")
        if let choice = readLine() {
            switch choice {
            case "1":
                if enemyPlayer.team[0].pv <= 0 {
                    print("Vous ne pouvez pas attaquer un combattant KO.")
                    chooseTarget()
                } else {
                    target.insert(enemyPlayer.team[0], at: 0)
                    print("Vous choisissez d'attaquer \(target[0].name) ")
                }
            case "2":
                if enemyPlayer.team[1].pv <= 0 {
                    print("Vous ne pouvez pas attaquer un combattant KO.")
                    chooseTarget()
                } else {
                    target.insert(enemyPlayer.team[1], at: 0)
                    print("Vous choisissez d'attaquer \(target[0].name) ")
                }
            case "3":
                if enemyPlayer.team[2].pv <= 0 {
                    print("Vous ne pouvez pas attaquer un combattant KO.")
                    chooseTarget()
                } else {
                    target.insert(enemyPlayer.team[2], at: 0)
                    print("Vous choisissez d'attaquer \(target[0].name) ")
                }
            default:
                print("Vous devez renter un nombre entre 1 et 3.")
                chooseTarget()
            }
        }
    }
    
    private func attackOrHeal() {
        if fighter[0].number == 4 || fighter[0].number == 3 {
            print("Tapez 1 pour attaquer quelqu'un de l'équipe adverse ou 2 pour soigner un de vos personnages.")
            if let choice = readLine() {
                switch choice {
                case "1":
                    chooseTarget()
                    attackNormalOrWithBonusWeapon()
                case "2":
                    print("Tapez le numéro du personnage que vous voulez soigner dans votre équipe.")
                    healTeamMate()
                default:
                    print("Vous devez rentrer un nombre entre 1 et 2.")
                    attackOrHeal()
                }
            }
        }
        else {
            chooseTarget()
            attackNormalOrWithBonusWeapon()
        }
    }
    
    private func attackNormalOrWithBonusWeapon() {
        let bonusWeapon = [WoodStick(), FireWand(), AmericanFist(), Spoon(), NurseWand()]
        let numb:Int = Int(arc4random_uniform(UInt32(20)))
        if numb <= 3 {
            target[0].pv = target[0].pv - bonusWeapon[numb].damages
            print("\(self.name) attaque \(target[0].name) avec \(fighter[0].name) armé \(bonusWeapon[numb].name) et inflige \(bonusWeapon[numb].damages) points de dommage.")        }
        else if numb == 4 {
            target[0].pv = target[0].pv - bonusWeapon[numb].damages
            print("\(self.name) attaque \(target[0].name) avec \(fighter[0].name) armé de \(bonusWeapon[numb].name) et lui donne 35 points de vie.")        }
        else {
            target[0].pv = target[0].pv - fighter[0].weaponDmg
            print("\(self.name) attaque \(target[0].name) avec \(fighter[0].name) et inflige \(fighter[0].weaponDmg) points de dommage.")
        }
    }
    
    private func healTeamMate() {
        if let choice = readLine() {
            switch choice {
            case "1":
                if team[0].pv > 0 {
                    team[0].pv = team[0].pv + 40
                    print("Vous avez soigné \(team[0].name) de 40 points de vie.")
                } else {
                    print("Vous ne pouvez pas soigner un combattant KO.")
                    attackOrHeal()
                }
            case "2":
                if team[1].pv > 0 {
                    team[1].pv = team[1].pv + 40
                    print("Vous avez soigné \(team[1].name) de 40 points de vie.")
                } else {
                    print("Vous ne pouvez pas soigner un combattant KO.")
                    attackOrHeal()
                }
            case "3":
                if team[2].pv > 0 {
                    team[2].pv = team[2].pv + 40
                    print("Vous avez soigné \(team[2].name) de 40 points de vie.")
                } else {
                    print("Vous ne pouvez pas soigner un combattant KO.")
                    attackOrHeal()
                }
            default:
                print("Vous devez rentrer un nombre entre 1 et 3.")
                attackOrHeal()
            }
        }
    }
    
    func checkTeamAlive() -> Bool {
        if team[0].pv <= 0 && team[1].pv <= 0 && team[2].pv <= 0{
            return true
        } else {
            return false
        }
    }
    
    private func checkPv() {
        if team[0].pv < 0 {
            team[0].pv = 0
        } else if team[1].pv < 0 {
            team[1].pv = 0
        } else if team[2].pv < 0 {
            team[2].pv = 0
        }
    }
    
    func fight() {
        print("\(self.name) c'est à votre tour de jouer.")
        self.showTeam()
        self.showEnemyTeam()
        self.chooseFighter()
        self.attackOrHeal()
        self.checkPv()
        enemyPlayer.checkPv()
    }
}



