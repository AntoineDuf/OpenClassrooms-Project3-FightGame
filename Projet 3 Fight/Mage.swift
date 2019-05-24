//
//  Mage.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de l'objet Mage
class Mage: Character {
    init() {
        super.init(numberCharacter: Number.mage.rawValue, typeCharacter : Type.mage.rawValue, nameCharacter: Name.mage.rawValue, pvCharacter: 120, nameWeapon: Weapon.mage.rawValue, weaponCharacterDmg: 60)
    }
}
