//
//  Character.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de la classe personnage
class Character {
    var number: Int
    var type: String
    var name: String
    var pv: Int
    private var weapon : String
    var weaponDmg: Int
    func presentation() {
        print ("\(number). \(name) the \(type) with \(pv) points of life and armed with \(weapon) that deals \(weaponDmg) damage points.")
    }
    func presentationWhithoutNumb() {
        print ("\(name) the \(type) with \(pv) points of life and armed with \(weapon) that deals \(weaponDmg) damage points.")
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
