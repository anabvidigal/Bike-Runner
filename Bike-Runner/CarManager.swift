//
//  CarManager.swift
//  Bike-Runner
//
//  Created by Ana Bittencourt Vidigal on 28/01/22.
//

import Foundation
import SpriteKit

class CarManager {
    
    private var node: SKSpriteNode
    
    private let interval = TimeInterval(4)
    private var currentTime = TimeInterval(0)
    
    init(node: SKSpriteNode) {
        self.node = node
        currentTime = interval
        physicsSetup()
    }
    
    func physicsSetup() {
        
        let body = SKPhysicsBody(rectangleOf: CGSize(width: 240.3, height: 102.6))
        body.isDynamic = true
        body.affectedByGravity = false
        body.contactTestBitMask = Constants.carTopLaneContact
        body.categoryBitMask = Constants.carTopLaneCategory
        body.collisionBitMask = Constants.carCollision
        node.physicsBody = body
    }
    
    func update(deltaTime: TimeInterval) {
        
        currentTime += deltaTime
        
        if currentTime > interval {
            currentTime -= interval
        }
        
        node.position.x -= GameManager.speed * deltaTime * cos(Constants.roadAngle * .pi / 180) * Constants.roadSpeed
        node.position.y -= GameManager.speed * deltaTime * sin(Constants.roadAngle * .pi / 180) * Constants.roadSpeed
    }
    
    func die() {
    }
}
    


enum LaneCarStatus {
    case topLane
    case bottomLane
}

// bottom -257
// top -199
