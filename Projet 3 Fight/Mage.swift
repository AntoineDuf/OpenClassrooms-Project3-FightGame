//
//  Mage.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation of Mage object. And override mother method for having a different presention for this character.

class Mage: Character {
    override func presentation(number: Int) {
        print("\(number). \(name) le \(type) avec \(pv) points de vie et est armé \(weapon) qui inflige \(weaponDmg) points de dommage. Il est aussi capable de lancer un sort de soin sur ses coéquipiers et ainsi de leur rendre 20 points de vie.")
    }
    init() {
        super.init(type: Type.mage.rawValue, name: Name.mage.rawValue, pv: 120, weapon: Weapon.mage.rawValue, weaponDmg: 60, pvMax: 120)
    }
}
