//
//  Paladin.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation of Paladin object.

class Paladin: Character {
    init() {
        super.init(type: Type.paladin.rawValue, name: "", pv: 200, weapon: Weapon.paladin.rawValue, weaponDmg: 40, pvMax: 200)
    }
}

