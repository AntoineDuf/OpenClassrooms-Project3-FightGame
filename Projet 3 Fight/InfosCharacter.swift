//
//  nameCharacter.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 15/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

enum Name: String {
    case warrior = "Akin"
    case paladin = "Jacob"
    case mage = "Aldat"
    case wizard = "Merlin"
    case priest = "Gabriel"
    case thief = "Jaskier"
}

enum Type: String {
    case warrior = "guerrier"
    case paladin = "paladin"
    case mage = "mage"
    case wizard = "sorcier"
    case priest = "prêtre"
    case thief = "voleur"
}

enum Weapon: String {
    case warrior = "d'une épée"
    case paladin = "d'un marteau"
    case mage = "d'un gant magique"
    case wizard = "d'une baguette magique"
    case priest = "d'une flemberge"
    case thief = "d'un couteau"
}

var dictCharacter = [1: Warrior(),2: Paladin(),3: Mage(),4: Wizard(),5: Priest(),6: Thief()]
