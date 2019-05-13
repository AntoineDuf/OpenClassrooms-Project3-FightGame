//
//  Paladin.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de l'objet Paladin
class Paladin: Character {
    override var typeCharacter: String {
        didSet {
            typeCharacter = "paladin"
        }
    }
    override var nameCharacter: String {
        didSet {
            nameCharacter = "Jacob"
        }
    }
    override var pvCharacter: Int {
        didSet {
            pvCharacter = 200
        }
    }
    override var nameWeapon: String {
        didSet {
            nameWeapon = "a hammer"
        }
    }
    override var weaponCharacterDmg: Int{
        didSet {
            weaponCharacterDmg = 40
        }
    }
    init(){
        super.init (typeCharacter : "paladin", nameCharacter: "Jacob", pvCharacter: 200, nameWeapon: "hammer", weaponCharacterDmg: 40)
    }
}

