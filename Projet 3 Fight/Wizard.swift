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
        super.init(type: Type.wizard.rawValue, name: Name.wizard.rawValue, pv: 120, weapon: Weapon.wizard.rawValue, weaponDmg: 60)
    }
}
