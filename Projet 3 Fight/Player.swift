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
    }
    
    func setName() {
        print("Quel est le nom du joueur \(number) ?")
        if let name = readLine() {
            self.name = name
        }
        if name.contains(" ") {
            print("Les espaces sont interdits !")
            setName()
        }
        else if name.isEmpty {
            print("Vous devez rentrer un nom !")
            setName()
            
        }
        else {
            print("Bonjour \(name) !")
        }
    }
    
    func verifySameName() {
        if player1.name == player2.name {
            print("Joueur 2 vous ne pouvez pas choisir le même nom que \(player1.name)")
            player2.setName()
            verifySameName()
        }
    }
    
    func playerTeam() {
        print("\(name) c'est à votre tour de choisir. Tapez le nombre attaché au personnage pour le choisir.")
        if let choice = readLine(){
            switch choice {
            case "1":
                if verifyAvailability(numberAvailability: 1) {
                    team.append(Warrior())
                }
            case "2":
                if verifyAvailability(numberAvailability: 2) {
                    team.append(Paladin())
                }
            case "3":
                if verifyAvailability(numberAvailability: 3) {
                    team.append(Mage())
                }
            case "4":
                if verifyAvailability(numberAvailability: 4) {
                    team.append(Wizard())
                }
            case "5":
                if verifyAvailability(numberAvailability: 5) {
                    team.append(Priest())
                }
            case "6":
                if verifyAvailability(numberAvailability: 6) {
                    team.append(Thief())
                }
            default:
                print("Vous devez renter un nombre entre 1 et 6.")
                playerTeam()            }
        }
    }
    
    func enemy() {
        if number == 1 {
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
        print("\(name) a dans son équipe:")
        var numb = 1
        for i in 0..<team.count {
            team[i].presentation(number: numb)
            numb += 1
        }
    }
    
    private func showEnemyTeam() {
        if number == 1 {
            player2.showTeam()
        } else {
            player1.showTeam()
        }
    }
    
    private func chooseFighter() {
        print("\(name) choisissez votre combattant en tapant son numéro.")
        if let choice = readLine() {
            switch choice {
            case "1":
                fighterAvailability(numberFighter: 0)
            case "2":
                fighterAvailability(numberFighter: 1)
            case "3":
                fighterAvailability(numberFighter: 2)
            default:
                print("Vous devez renter un nombre entre 1 et 3.")
                chooseFighter()
            }
        }
    }
    
    private func fighterAvailability(numberFighter: Int) {
        if team[numberFighter].pv <= 0 {
            print("Vous ne pouvez pas choisir un combattant KO.")
            chooseFighter()
        } else {
            fighter.append(team[numberFighter])
            print("Vous avez choisi d'attaquer avec \(fighter.first!.name) ")
        }
    }
    
    private func chooseTarget() {
        print("\(name) Choisissez une cible en tapant son numéro.")
        if let choice = readLine() {
            switch choice {
            case "1":
                targetAvailability(numberTarget: 0)
            case "2":
                targetAvailability(numberTarget: 1)
            case "3":
                targetAvailability(numberTarget: 2)
            default:
                print("Vous devez renter un nombre entre 1 et 3.")
                chooseTarget()
            }
        }
    }
    
    private func targetAvailability(numberTarget: Int) {
        if enemyPlayer.team[numberTarget].pv <= 0 {
            print("Vous ne pouvez pas attaquer un combattant KO.")
            chooseTarget()
        } else {
            target.append(enemyPlayer.team[numberTarget])
            print("Vous choisissez d'attaquer \(fighter.first!.name) ")
        }
    }
    
    private func attackOrHeal() {
        if fighter.first?.type == Type.mage.rawValue || fighter.first?.type == Type.wizard.rawValue {
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
        let numb = Int(arc4random_uniform(UInt32(20)))
        if numb <= 3 {
            retrieveLivePoints(damagePoints: bonusWeapon[numb].damages, weaponName: bonusWeapon[numb].name)
        }
        else if numb == 4 {
            target.first!.pv -= bonusWeapon[numb].damages
            print("\(name) attaque \(target.first!.name) avec \(fighter.first!.name) armé de \(bonusWeapon[numb].name) et lui donne 35 points de vie.")        }
        else {
            retrieveLivePoints(damagePoints: fighter.first!.weaponDmg, weaponName: fighter.first!.weapon)
        }
    }
    
    private func retrieveLivePoints(damagePoints: Int, weaponName: String) {
        target.first!.pv -= damagePoints
        print("\(name) attaque \(target.first!.name) avec \(fighter.first!.name) armé \(weaponName) et inflige \(damagePoints) points de dommage.")
    }
    
    private func healTeamMate() {
        if let choice = readLine() {
            switch choice {
            case "1":
                availabilityToHeal(numberTeamMate: 0)
            case "2":
                availabilityToHeal(numberTeamMate: 1)
            case "3":
                availabilityToHeal(numberTeamMate: 2)
            default:
                print("Vous devez rentrer un nombre entre 1 et 3.")
                attackOrHeal()
            }
        }
    }
    
    private func availabilityToHeal(numberTeamMate: Int) {
        if team[numberTeamMate].pv > 0 {
            team[numberTeamMate].pv += 40
            print("Vous avez soigné \(team[numberTeamMate].name) de 40 points de vie.")
        }
        else {
            print("Vous ne pouvez pas soigner un combattant KO.")
            attackOrHeal()
        }
    }
    
    func checkTeamAlive() -> Bool {
        return team.first!.pv <= 0 && team[1].pv <= 0 && team[2].pv <= 0
    }
    
    private func checkPv() {
        for i in 0..<2 {
            if team[i].pv < 0 {
                team[i].pv = 0
            }
        }
    } 
    
    func fight() {
        print("\(name) c'est à votre tour de jouer.")
        showTeam()
        showEnemyTeam()
        chooseFighter()
        attackOrHeal()
        checkPv()
        enemyPlayer.checkPv()
    }
}



