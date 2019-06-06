//
//  Character.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de la classe personnage
class Character {
    var type: String
    var name: String
    var pv: Int
    var weapon: String
    var weaponDmg: Int
    
    func presentation(number: Int) {
        print("\(number). \(name) le \(type) avec \(pv) points de vie et armé avec \(weapon) qui inflige \(weaponDmg) points de dommage.")
    }
    
    init(type: String, name: String, pv: Int, weapon: String, weaponDmg: Int) {
        self.type = type
        self.name = name
        self.pv = pv
        self.weapon = weapon
        self.weaponDmg = weaponDmg
    }
}
