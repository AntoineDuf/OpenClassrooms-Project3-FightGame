//
//  nameCharacter.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 15/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

internal enum Number: Int {
    case warrior = 1
    case paladin = 2
    case mage = 3
    case wizard = 4
    case priest = 5
    case thief = 6
}

internal enum Name: String {
    case warrior = "Akin"
    case paladin = "Jacob"
    case mage = "Aldat"
    case wizard = "Merlin"
    case priest = "Gabriel"
    case thief = "Jaskier"
}

internal enum Type: String {
    case warrior = "warrior"
    case paladin = "paladin"
    case mage = "mage"
    case wizard = "wizard"
    case priest = "priest"
    case thief = "thief"
}

internal enum Weapon: String {
    case warrior = "a sword"
    case paladin = "a hammer"
    case mage = "some gloves"
    case wizard = "a wand"
    case priest = "a flemberge"
    case thief = "some knives"
}
