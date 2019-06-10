//
//  Player.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 19/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

/*
 This class contains all the Player mecanics.
 The principals methods for the good operation of this project are in this class.
 
 LIST OF TOOLS IN THE CLASS AND METHODS REFERE TO THEM:
 Player informations: -setName
                      -verifySameName
                      -enemy
                      -playerTeam (verifyAvailability(removeCharacter))
                      -showTeam
                      -showEnemyTeam
 
 Choose a fighter and a target in a turn: -chooseFighter (fighterAvailability)
                                      -chooseTarget (targetAvailability)
 
 Fight mecanics in a trun: -attackOrHeal
                             -attackNormalOrWithBonusWeapon (presentationBonusWeapon)
                             -retrieveLifePoints
                             -healTeamMate (availabilityToHeal)
 
 Check team and character: -checkTeamAlive
                           -checkPv
 
 Graphic help: -separateLine
 
 Order call of methods: -fight
 */


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

    //MARK: -PLAYER INFORMATIONS

    //This method ask the name of the player and verify if there is no space and if the name is empty.
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
    
    //This method verify if the same are the same or not.
    func verifySameName() {
        if player1.name == player2.name {
            print("Joueur 2 vous ne pouvez pas choisir le même nom que \(player1.name).")
            player2.setName()
            verifySameName()
        }
    }
    
    //This method create an enemy player for each player.
    func enemy() {
        if number == 1 {
            enemyPlayer = player2
        } else {
            enemyPlayer = player1
        }
    }
    
    //This method ask to the players to choose his team of fighter.
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
                print("Vous devez rentrer un nombre entre 1 et 6.")
                playerTeam()            }
        }
    }
    
    //This method prevent a character to be pick two time.
    private func removeCharacter(forKey: Int) {
        dictCharacter.removeValue(forKey: forKey)
    }
    
    //This method verify the disponibility of a character.
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
    
    //This method permit to see the fighter team.
    private func showTeam() {
        print("\(name) a dans son équipe:")
        var numb = 1
        for i in 0..<team.count {
            team[i].presentation(number: numb)
            numb += 1
        }
    }
    
    //This method permit to see the enemy fighter team.
    private func showEnemyTeam() {
        if number == 1 {
            player2.showTeam()
        } else {
            player1.showTeam()
        }
    }
    
    /////////////////////////////////////////////////
    //MARK: CHOOSE A FIGHTER AND A TARGET IN A TURN//
    /////////////////////////////////////////////////
    
    //This method permit to choose a fighter for the turn.
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
                print("Vous devez rentrer un nombre entre 1 et 3.")
                chooseFighter()
            }
        }
    }
    
    //This method check if the chosen fighter is KO or if is he available.
    private func fighterAvailability(numberFighter: Int) {
        if team[numberFighter].pv <= 0 {
            print("Vous ne pouvez pas choisir un combattant KO.")
            chooseFighter()
        } else if let lastFighter = fighter.last {
            fighter.append(team[numberFighter])
            print("Vous avez choisi d'attaquer avec \(lastFighter.name) ")
        }
    }
  
    //This method permit to choose a target for the turn.
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
                print("Vous devez rentrer un nombre entre 1 et 3.")
                chooseTarget()
            }
        }
    }
    
    //This method check if the chosen target is KO or if is he available.
    private func targetAvailability(numberTarget: Int) {
        if enemyPlayer.team[numberTarget].pv <= 0 {
            print("Vous ne pouvez pas attaquer un combattant KO.")
            chooseTarget()
        } else {
            target.append(enemyPlayer.team[numberTarget])
            print("Vous choisissez d'attaquer \(target.last!.name).")
        }
    }
    
    ////////////////////////////////////////////
    //MARK: ATTACK OR HEAL MECANICS IN A TURN //
    ////////////////////////////////////////////
    
    //This method ask if the choice of the player is to attock or to heal a teammate if the choosen fighter is a mage or a wizard.
    private func attackOrHeal() {
        if fighter.last!.type == Type.mage.rawValue || fighter.last!.type == Type.wizard.rawValue {
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
        separateLine()
    }
    
    //This method generate a normal attack with the weapon of the character or the if it is spawn a bonus weapon in a vault.
    private func attackNormalOrWithBonusWeapon() {
        let bonusWeapon = [WoodStick(), FireWand(), AmericanFist(), Spoon(), NurseWand()]
        let numb = Int(arc4random_uniform(UInt32(20)))
        if numb <= 3 {
            presentationBonusWeapon(weaponName: bonusWeapon[numb].name)
            retrieveLifePoints(damagePoints: bonusWeapon[numb].damage, weaponName: bonusWeapon[numb].name)
        }
        else if numb == 4, let lastFighter = fighter.last, let lastTarget = target.last {
            presentationBonusWeapon(weaponName: bonusWeapon[numb].name)
            target.last!.pv -= bonusWeapon[numb].damage
            separateLine()
            print("\(name) attaque \(lastTarget.name) avec \(lastFighter.name) armé de \(bonusWeapon[numb].name) et lui donne 30 points de vie.")
            if target.last!.pv == target.last!.pvMax {
                separateLine()
                print("Les points de vie de \(lastTarget.name) sont au maximum l'attaque n'a donc pas fait d'effet.")
            }
        }
        else {
            retrieveLifePoints(damagePoints: fighter.last!.weaponDmg, weaponName: fighter.last!.weapon)
        }
    }
    
    //This method present the bonus weapon if there is one.
    private func presentationBonusWeapon(weaponName: String) {
        separateLine()
        print("Un coffre est apparu devant \(fighter.last!.name) avec \(weaponName) à l'intérieur. \(fighter.last!.name) se voit contraint de l'utiliser!")
        separateLine()
    }
    
    //This method calculate the attack and retrieve life points to the target.
    private func retrieveLifePoints(damagePoints: Int, weaponName: String) {
        target.last!.pv -= damagePoints
        separateLine()
        print("\(name) attaque \(target.last!.name) avec \(fighter.last!.name) armé \(weaponName) et inflige \(damagePoints) points de dommage.")
    }
    
    //This method permit the player to choose the teammate to heal.
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
    
    //This method verify if the choosen teammate is not KO or if he doesn't have his life point to the maximum
    private func availabilityToHeal(numberTeamMate: Int) {
        if team[numberTeamMate].pv > 0 && team[numberTeamMate].pv < team[numberTeamMate].pvMax {
            team[numberTeamMate].pv += 20
            separateLine()
            print("Vous avez soigné \(team[numberTeamMate].name) de 20 points de vie.")
        }
        else if team[numberTeamMate].pv == team[numberTeamMate].pvMax {
            print("Vous ne pouvez pas soigner un combattant qui a déjà ses points de vie au maximum.")
            attackOrHeal()
        }
        else {
            print("Vous ne pouvez pas soigner un combattant KO.")
            attackOrHeal()
        }
    }
    
    /////////////////////////////////////////
    //MARK: CHECK TEAM PLAYER AND CHARACTER//
    /////////////////////////////////////////
    
    //This method check if a team is completely KO or not.
    func checkTeamAlive() -> Bool {
        return team.first!.pv == 0 && team[1].pv == 0 && team[2].pv == 0
    }
    
    //This method permit to check that the pv of the character or never below 0 and never above of their maximum life points.
    private func checkPv() {
        for i in 0..<3 {
            if team[i].pv < 0 {
                team[i].pv = 0
            }
        }
        for i in 0..<3 {
            if team[i].pv > team[i].pvMax {
                team[i].pv = team[i].pvMax
            }
        }
    } 
    
    //////////////////////
    //MARK: GRAPHIC HELP//
    //////////////////////
    
    //This method permit to have a better readability in the terminal mode.
    func separateLine() {
        print("--------------------------------------------------------------")
    }
    
    ///////////////////////////////
    //MARK: ORDER CALL OF METHODS//
    ///////////////////////////////
    
    //This method call all the methods of a fight turn.
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



