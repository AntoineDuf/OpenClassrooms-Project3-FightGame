//
//  Wizard.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de l'objet Wizard
class Wizard: Character {
    init() {
        super.init(numberCharacter: Number.wizard.rawValue, typeCharacter : Type.wizard.rawValue, nameCharacter: Name.wizard.rawValue, pvCharacter: 120, nameWeapon: Weapon.wizard.rawValue, weaponCharacterDmg: 60)
    }
}
