//
//  Mage.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de l'objet Mage
class Mage: Character {
    override var typeCharacter: String {
        didSet {
            typeCharacter = "mage"
        }
    }
    override var nameCharacter: String {
        didSet {
            nameCharacter = "Aldat"
        }
    }
    override var pvCharacter: Int {
        didSet {
            pvCharacter = 120
        }
    }
    override var nameWeapon: String {
        didSet {
            nameWeapon = "some gloves"
        }
    }
    override var weaponCharacterDmg: Int{
        didSet {
            weaponCharacterDmg = 60
        }
    }
    init(){
        super.init (typeCharacter : "mage", nameCharacter: "Aldat", pvCharacter: 120, nameWeapon: "gloves", weaponCharacterDmg: 60)
    }
}
