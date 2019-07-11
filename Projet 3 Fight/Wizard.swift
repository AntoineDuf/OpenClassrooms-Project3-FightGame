//
//  Wizard.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation of Wizard object. And override mother method for having a different presention for this character.

class Wizard: Character {
    override func presentationType(number: Int) {
        super.presentationType(number: 4)
        print("Il est aussi capable de lancer un sort de soin sur ses coéquipiers et ainsi de leur rendre 20 points de vie.")
    }
    override func presentationCharacter(number: Int) {
        print("\(number). \(name) le \(type) avec \(pv) points de vie qui est armé \(weapon) qui inflige \(weaponDmg) points de dommage. Il est aussi capable de lancer un sort de soin sur ses coéquipiers et ainsi de leur rendre 20 points de vie.")
    }
    init() {
        super.init(type: Type.wizard.rawValue, name: "", pv: 120, weapon: Weapon.wizard.rawValue, weaponDmg: 60, pvMax: 120)
    }
}
