//
//  Character.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

var dictCharacter = ["1": Warrior.self, "2": Paladin.self, "3": Mage.self, "4": Wizard.self, "5": Priest.self, "6": Thief.self]


//Creation de la classe personnage
internal class Character {
    private var number: Int
    internal var type: String
    internal var name: String
    internal var pv: Int
    private var weapon : String
    internal var weaponDmg: Int
    internal func presentation() {
        print ("\(number). \(name) the \(type) with \(pv) points of life and armed with \(weapon) that deals \(weaponDmg) damage points.")
    }
    init(numberCharacter: Int, typeCharacter: String, nameCharacter: String, pvCharacter: Int, nameWeapon: String, weaponCharacterDmg: Int) {
        self.number = numberCharacter
        self.type = typeCharacter
        self.name = nameCharacter
        self.pv = pvCharacter
        self.weapon = nameWeapon
        self.weaponDmg = weaponCharacterDmg
    }
}
