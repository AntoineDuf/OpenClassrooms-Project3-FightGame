//
//  Wizard.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 08/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

//Creation de l'objet Wizard
class Wizard: Character {
    override var typeCharacter: String {
        didSet {
            typeCharacter = "wizard"
        }
    }
    override var nameCharacter: String {
        didSet {
            nameCharacter = "Merlin"
        }
    }
    override var pvCharacter: Int {
        didSet {
            pvCharacter = 120
        }
    }
    override var nameWeapon: String {
        didSet {
            nameWeapon = "a wand"
        }
    }
    override var weaponCharacterDmg: Int{
        didSet {
            weaponCharacterDmg = 60
        }
    }
    init(){
        super.init (typeCharacter : "wizard", nameCharacter: "Merlin", pvCharacter: 120, nameWeapon: "wand", weaponCharacterDmg: 60)
    }
}
