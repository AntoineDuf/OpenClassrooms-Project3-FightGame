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
    override var typeCharacter: String {
        didSet {
            typeCharacter = "priest"
        }
    }
    override var nameCharacter: String {
        didSet {
            nameCharacter = "Gabriele"
        }
    }
    override var pvCharacter: Int {
        didSet {
            pvCharacter = 140
        }
    }
    override var nameWeapon: String {
        didSet {
            nameWeapon = "a flamberge"
        }
    }
    override var weaponCharacterDmg: Int{
        didSet {
            weaponCharacterDmg = 50
        }
    }
    init(){
        super.init (typeCharacter : "priest", nameCharacter: "Gabriele", pvCharacter: 140, nameWeapon: "flamberge", weaponCharacterDmg: 50)
    }
}
