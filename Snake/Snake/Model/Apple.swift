//
//  Apple.swift
//  Snake
//
//  Created by Александр Филиппов on 23.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import SpriteKit
import UIKit

class Apple: SKShapeNode {
    convenience init (position: CGPoint) {
        self.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        fillColor = UIColor.red
        strokeColor = UIColor.red
        lineWidth = 5
        self.position = position
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center: CGPoint(x: 5, y: 5))
        physicsBody?.categoryBitMask = CollisionCategories.Apple
    }
}
