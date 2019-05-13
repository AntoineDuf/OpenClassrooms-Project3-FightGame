//
//  Thief.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de l'objet Thief
class Thief: Character {
    override var typeCharacter: String {
        didSet {
            typeCharacter = "thief"
        }
    }
    override var nameCharacter: String {
        didSet {
            nameCharacter = "Jaskier"
        }
    }
    override var pvCharacter: Int {
        didSet {
            pvCharacter = 140
        }
    }
    override var nameWeapon: String {
        didSet {
            nameWeapon = "some knives"
        }
    }
    override var weaponCharacterDmg: Int{
        didSet {
            weaponCharacterDmg = 50
        }
    }
    init(){
        super.init (typeCharacter : "thief", nameCharacter: "Jaskier", pvCharacter: 140, nameWeapon: "knives", weaponCharacterDmg: 50)
    }
}
