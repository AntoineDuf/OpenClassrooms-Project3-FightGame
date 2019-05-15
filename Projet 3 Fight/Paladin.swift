//
//  Paladin.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de l'objet Paladin
class Paladin: Character {
    init() {
        super.init (numberCharacter: Number.paladin.rawValue, typeCharacter : Type.paladin.rawValue, nameCharacter: Name.paladin.rawValue, pvCharacter: 200, nameWeapon: Weapon.paladin.rawValue, weaponCharacterDmg: 40)
    }
}

