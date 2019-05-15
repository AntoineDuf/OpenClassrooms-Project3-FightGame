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
    init(){
        super.init (numberCharacter: Number.warrior.rawValue, typeCharacter : Type.warrior.rawValue, nameCharacter: Name.warrior.rawValue, pvCharacter: 200, nameWeapon: Weapon.warrior.rawValue, weaponCharacterDmg: 40)
        
    }
}

