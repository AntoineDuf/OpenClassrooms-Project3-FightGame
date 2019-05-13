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
    var typeCharacter: String
    var nameCharacter: String
    var pvCharacter: Int
    var nameWeapon : String
    var weaponCharacterDmg: Int
    var presentationCharacter : String {
        return " \(nameCharacter) the \(typeCharacter) with \(pvCharacter) points of life and armed with \(nameWeapon) that deals \(weaponCharacterDmg) damage points."    }
    init (typeCharacter: String, nameCharacter: String, pvCharacter: Int,nameWeapon: String, weaponCharacterDmg: Int) {
        self.typeCharacter = typeCharacter
        self.nameCharacter = nameCharacter
        self.pvCharacter = pvCharacter
        self.nameWeapon = nameWeapon
        self.weaponCharacterDmg = weaponCharacterDmg
    }
}
