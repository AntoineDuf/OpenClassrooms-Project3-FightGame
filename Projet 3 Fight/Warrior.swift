//
//  Warrior.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de l'objet Warrior
class Warrior: Character {
    override var typeCharacter: String {
        didSet {
            typeCharacter = "warrior"
        }
    }
    override var nameCharacter: String {
        didSet {
            nameCharacter = "Akin"
        }
    }
    override var pvCharacter: Int {
        didSet {
            pvCharacter = 200
        }
    }
    override var nameWeapon: String {
        didSet {
            nameWeapon = "a sword"
        }
    }
    override var weaponCharacterDmg: Int{
        didSet {
            weaponCharacterDmg = 40
        }
    }
    init(){
        super.init (typeCharacter : "warrior", nameCharacter: "Akin", pvCharacter: 200, nameWeapon: "sword", weaponCharacterDmg: 40)
    }
}

