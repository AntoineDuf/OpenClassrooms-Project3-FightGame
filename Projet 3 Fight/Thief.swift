//
//  Thief.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation of Thief object.

class Thief: Character {
    init() {
        super.init(type: Type.thief.rawValue, name: "", pv: 140, weapon: Weapon.thief.rawValue, weaponDmg: 50, pvMax: 140)
    }
}
