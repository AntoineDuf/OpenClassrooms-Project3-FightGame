//
//  nameCharacter.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 15/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

enum Number: Int {
    case warrior = 1
    case paladin = 2
    case mage = 3
    case wizard = 4
    case priest = 5
    case thief = 6
}

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
    case warrior = "une épée"
    case paladin = "un marteau"
    case mage = "un gant magique"
    case wizard = "une baguette magique"
    case priest = "une flemberge"
    case thief = "un couteau"
}

var dictCharacter = [1: Warrior(),2: Paladin(),3: Mage(),4: Wizard(),5: Priest(),6: Thief()]
