//
//  Game.swift
//  Projet 3 Fight
//
//  Created by Antoine Dufayet on 23/05/2019.
//  Copyright © 2019 NatProd. All rights reserved.
//

import Foundation

class Game {
    var player1: Player
    var player2: Player
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    func createPlayerTeam() {
        while player1.team.count < 3 && player2.team.count < 3{
            player1.PlayerTeam()
            player2.PlayerTeam()
        }
    }
}
