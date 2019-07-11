//
//  Character.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

/*
 This class contains all characters caracteristics and a method for the presentation of each character.
 */

class Character {
    var type: String
    var name: String
    var pv: Int
    var weapon: String
    var weaponDmg: Int
    let pvMax: Int
    
    func presentationType(number: Int) {
        print("\(number). Le \(type) avec \(pv) points de vie qui sera armé \(weapon) qui inflige \(weaponDmg) points de dommage.")
    }
    
    func presentationCharacter(number: Int) {
        print("\(number). \(name) le \(type) avec \(pv) points de vie qui est armé \(weapon) qui inflige \(weaponDmg) points de dommage.")
    }
    
    init(type: String, name: String, pv: Int, weapon: String, weaponDmg: Int, pvMax: Int) {
        self.type = type
        self.name = name
        self.pv = pv
        self.weapon = weapon
        self.weaponDmg = weaponDmg
        self.pvMax = pvMax
    }
}
