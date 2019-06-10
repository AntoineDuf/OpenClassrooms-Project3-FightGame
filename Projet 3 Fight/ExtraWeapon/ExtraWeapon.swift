//
//  ExtraWeapon.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 04/06/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

/*
 This class contains the damage and name caracteristics for all the bonus weapon.
 */

class ExtraWeapon {
    var damage: Int
    var name: String
    
    init(name: String, damage: Int){
        self.name = name
        self.damage = damage
    }
}
