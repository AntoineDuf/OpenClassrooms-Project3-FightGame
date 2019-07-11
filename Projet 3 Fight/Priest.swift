//
//  Priest.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation of Priest object.

class Priest: Character {
    init() {
        super.init(type: Type.priest.rawValue, name: "", pv: 140, weapon: Weapon.priest.rawValue, weaponDmg: 50, pvMax: 140)
    }
}
