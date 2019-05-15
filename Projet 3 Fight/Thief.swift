//
//  Thief.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de l'objet Thief
class Thief: Character {
    init(){
        super.init (numberCharacter: Number.thief.rawValue, typeCharacter : Type.thief.rawValue, nameCharacter: Name.thief.rawValue, pvCharacter: 140, nameWeapon: Weapon.thief.rawValue, weaponCharacterDmg: 50)
    }
}
