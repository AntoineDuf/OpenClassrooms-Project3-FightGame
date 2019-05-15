//
//  Priest.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de l'objet Priest
class Priest: Character {
    init(){
        super.init (numberCharacter: Number.priest.rawValue, typeCharacter : Type.priest.rawValue, nameCharacter: Name.priest.rawValue, pvCharacter: 140, nameWeapon: Weapon.priest.rawValue, weaponCharacterDmg: 50)
    }
}
