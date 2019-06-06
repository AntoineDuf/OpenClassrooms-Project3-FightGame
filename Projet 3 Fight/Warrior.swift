//
//  Warrior.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de l'objet Warrior
class Warrior: Character {
    init() {
        super.init(type : Type.warrior.rawValue, name: Name.warrior.rawValue, pv: 200, weapon: Weapon.warrior.rawValue, weaponDmg: 40)
    }
}

