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
            print("Les espaces sont interdits!")
            self.setName()
        }
        else if name.isEmpty {
            print("Vous devez rentrer un nom!")
            self.setName()
        }
        else {
            print("Bonjour \(self.name)!")
        }
    }
    
    func playerTeam() {
        print("\(self.name) c'est a votre tour de choisir. Tapez le nombre attaché au personnage pour le choisir.")
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
            print ("Ce personnage a deja été choisi.")
            playerTeam()
            return false
        } else {
            print ("Ce personnage a été rajouté a votre équipe.")
            removeCharacter(forKey: numberAvailability)
            return true
        }
    }
    
    func showTeam() {
        print("\(self.name) a dans son équipe:")
        var numb = 1
        for i in 0..<self.team.count {
            print("\(numb)." + " \(self.team[i].presentationWhithoutNumb())")
            print(" \(self.team[i].presentationWhithoutNumb())")
            numb += 1
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
        print("\(self.name) Choississez votre combattant en tapan son numéro.")
        if let choice = readLine() {
            if self.team.count == 3 {
                switch choice {
                case "1":
                    fighter.insert(team[0], at: 0)
                    print("Vous avez choissis d'attaquer avec \(fighter[0].name) ")
                case "2":
                    fighter.insert(team[1], at: 0)
                    print("Vous avez choissis d'attaquer avec \(fighter[0].name) ")
                case "3":
                    fighter.insert(team[2], at: 0)
                    print("Vous avez choissis d'attaquer avec \(fighter[0].name) ")
                default:
                    print("Vous devez renter un nombre entre 1 et 3.")
                    chooseFighter()
                }
            }
            if self.team.count == 2 {
                switch choice {
                case "1":
                    fighter.insert(team[0], at: 0)
                    print("Vous avez choissis d'attaquer avec \(fighter[0].name) ")
                case "2":
                    fighter.insert(team[1], at: 0)
                    print("Vous avez choissis d'attaquer avec \(fighter[0].name) ")
                default:
                    print("Vous devez renter un nombre entre 1 et 2.")
                    chooseFighter()
                }
            }
            if self.team.count == 1 {
                switch choice {
                case "1":
                    fighter.insert(team[0], at: 0)
                    print("Vous avez choissis d'attaquer avec \(fighter[0].name) ")
                default:
                    print("Vous ne pouvez entrer uniquement le nombre 1.")
                    chooseFighter()
                }
            }
        }
    }
    
    func chooseTarget() {
        print("\(self.name) Choississez une cible en entran son numéro.")
        if let choice = readLine() {
            switch choice {
            case "1":
                target.insert(enemyPlayer.team[0], at: 0)
                print("Vous choississez d'attaquer \(target[0].name) ")
            case "2":
                target.insert(enemyPlayer.team[1], at: 0)
                print("Vous choississez d'attaquer \(target[0].name) ")
            case "3":
                target.insert(enemyPlayer.team[2], at: 0)
                print("Vous choississez d'attaquer \(target[0].name) ")
            default:
                print("Vous devez renter un nombre entre 1 et 3.")
                chooseTarget()
            }
        }
    }
    
    func attackOrHeal() {
        if fighter[0].number == 4 || fighter[0].number == 3 {
            print("Tapez 1 pour attaquer quelqu'un de l'équipe adverse ou 2 pour soignez un de vos personnages .")
            if let choice = readLine() {
                switch choice {
                case "1":
                    chooseTarget()
                    attack()
                case "2":
                    print("Tapez le numéro du personnage que vous voulez soigner dans votre équipe.")
                    healTeamMate()
                default:
                    print("Vous devez renter un nombre entre 1 et 2.")
                    attackOrHeal()
                }
            }
        }
        else {
            chooseTarget()
            attack()
        }
    }
    
    func attack() {
        let bonusWeapon = [1: WoodStick(), 2: FireWand(), 3: AmericanFist(), 4: Spoon(), 5: NurseWand()]
        let numb:Int = Int(arc4random_uniform(UInt32(20)))
        if numb <= 4 {
            target[0].pv = target[0].pv - bonusWeapon[numb]!.damages
            print("\(self.name) attaque \(target[0].name) avec \(fighter[0].name) armé \(bonusWeapon[numb]!.name) et inflige \(bonusWeapon[numb]!.damages) points de dommage.")        }
        else if numb == 5 {
            target[0].pv = target[0].pv - bonusWeapon[numb]!.damages
            print("\(self.name) attaque \(target[0].name) avec \(fighter[0].name) armé de \(bonusWeapon[numb]!.name) et lui donne 35 points de vie.")        }
        else {
            target[0].pv = target[0].pv - fighter[0].weaponDmg
            print("\(self.name) attaque \(target[0].name) avec \(fighter[0].name) et inflige \(fighter[0].weaponDmg) points de dommage.")
        }
    }
    
    func checkLife() {
        for i in 0..<self.team.count {
            if self.team[i].pv <= 0 {
                self.team.remove(at: i)
            }
        }
        //        for i in 0..<self.enemyPlayer.team.count {
        //            if self.enemyPlayer.team[i].pv <= 0 {
        //                self.enemyPlayer.team.remove(at: i)
        //            }
        //        }
    }
    
    func healTeamMate() {
        if let choice = readLine() {
            switch choice {
            case "1":
                team[0].pv = team[0].pv + 40
                print("Vous avez soigné \(team[0].name) de 40 points de vie.")
            case "2":
                team[1].pv = team[1].pv + 40
                print("Vous avez soigné \(team[1].name) de 40 points de vie.")
            case "3":
                team[2].pv = team[2].pv + 40
                print("Vous avez soigné \(team[2].name) de 40 points de vie.")
            default:
                print("Vous devez renter un nombre entre 1 et 3.")
                healTeamMate()
            }
        }
    }
    
    func fight() {
        print("\(self.name) c'est a votre tour de jouer.")
        self.checkLife()
        self.showTeam()
        self.showEnemyTeam()
        self.chooseFighter()
        self.attackOrHeal()
        self.checkLife()
    }
    
    
}



