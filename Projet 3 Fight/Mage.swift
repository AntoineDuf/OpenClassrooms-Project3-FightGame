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
        super.init(type: Type.mage.rawValue, name: Name.mage.rawValue, pv: 120, weapon: Weapon.mage.rawValue, weaponDmg: 60)
    }
}
