//
//  Warrior.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation of Warrior object.

class Warrior: Character {
    init() {
        super.init(type : Type.warrior.rawValue, name: "", pv: 200, weapon: Weapon.warrior.rawValue, weaponDmg: 40, pvMax: 200)
    }
}

