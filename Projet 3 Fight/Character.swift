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
        print("\(number). \(name) le \(type) avec \(pv) points de vie et armé avec \(weapon) qui inflige \(weaponDmg) points de dommage.")
    }
    
    func presentationWhithoutNumb() {
        print("\(name) le \(type) avec \(pv) points de vie et armé avec \(weapon) qui inflige \(weaponDmg) points de dommage.")
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
