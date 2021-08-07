//
//  Player.swift
//  DiveIntoSpriteKit-Project1B iOS
//
//  Created by David Malicke on 8/7/21.
//

import Foundation
import SpriteKit

extension GameScene {
    
    func findPlayer(_ touches: Set<UITouch>) {
        //recgonize that user is touching the screen
        guard let touch = touches.first else { return }
        
        //determine location of the touch
        let location = touch.location(in: self)
        
        //what nodes are being tapped at that location?
        let tappedNodes = nodes(at: location)
        
        if tappedNodes.contains(player) {
            touchingPlayer = true
        }
        
    }
    
    
    func trackPlayer(_ touches: Set<UITouch>) {
        guard touchingPlayer else { return }
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        player.position = location
    }
    
}


