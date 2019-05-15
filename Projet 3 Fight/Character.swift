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
    var numberCharacter: Int
    var typeCharacter: String
    var nameCharacter: String
    var pvCharacter: Int
    var nameWeapon : String
    var weaponCharacterDmg: Int
    func presentationCharacter() {
        print ("\(numberCharacter). \(nameCharacter) the \(typeCharacter) with \(pvCharacter) points of life and armed with \(nameWeapon) that deals \(weaponCharacterDmg) damage points.")
    }
    init (numberCharacter: Int, typeCharacter: String, nameCharacter: String, pvCharacter: Int,nameWeapon: String, weaponCharacterDmg: Int) {
        self.numberCharacter = numberCharacter
        self.typeCharacter = typeCharacter
        self.nameCharacter = nameCharacter
        self.pvCharacter = pvCharacter
        self.nameWeapon = nameWeapon
        self.weaponCharacterDmg = weaponCharacterDmg
    }
}
