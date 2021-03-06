//
//  GameScene.swift
//  Snake
//
//  Created by Александр Филиппов on 23.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var snake: Snake?
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        backgroundColor = SKColor.black
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.allowsRotation = false
        view.showsPhysics = true
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        self.physicsBody?.contactTestBitMask = CollisionCategories.SnakeHead

        
        let counterClockwiseButton = SKShapeNode()
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30)
        counterClockwiseButton.fillColor = UIColor.white
        counterClockwiseButton.strokeColor = UIColor.white
        counterClockwiseButton.lineWidth = 10
        counterClockwiseButton.name = "leftButton"
        
        self.addChild(counterClockwiseButton)
        
        let clockwiseButton = SKShapeNode()
        clockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockwiseButton.position = CGPoint(x: view.scene!.frame.maxX - 75, y: view.scene!.frame.minY + 30)
        clockwiseButton.fillColor = UIColor.white
        clockwiseButton.strokeColor = UIColor.white
        clockwiseButton.lineWidth = 10
        clockwiseButton.name = "rightButton"
        
        self.addChild(clockwiseButton)
        
        createApple()
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
    }
    
    func startNewGame() {
        removeAllChildren()
        self.didMove(to: view!)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode, touchedNode.name == "leftButton" || touchedNode.name == "rightButton" else {
                return
            }
            touchedNode.fillColor = .blue
            
            if touchedNode.name == "leftButton" {
                snake?.moveCounterClockwise()
            } else {
                snake?.moveClockwise()
            }
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode, touchedNode.name == "leftButton" || touchedNode.name == "rightButton" else {
                return
            }
            touchedNode.fillColor = .white
        }
       
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        snake!.move()
    }
    
    func createApple() {
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 10)) + 1)
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 40)) + 1)
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        self.addChild(apple)
    }
    
}



extension GameScene : SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let bodies = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let collisionObject = bodies ^ CollisionCategories.SnakeHead
        switch collisionObject {
        case CollisionCategories.Apple:
            snake?.addBodyPart()
            let apple = contact.bodyB.node is Apple ? contact.bodyB.node : contact.bodyA.node
            apple?.removeFromParent()
            createApple()
        case CollisionCategories.Snake:
            break
        case CollisionCategories.EdgeBody:
            _ = contact.bodyB.node is GameScene ? contact.bodyB.node : contact.bodyA.node
            removeAllChildren()
            didMove(to: view!)

        default:
            break
        }
    }
}

struct CollisionCategories {
    static let Snake: UInt32 = 0x1 << 0
    static let SnakeHead: UInt32 = 0x1 << 1
    static let Apple: UInt32 = 0x1 << 2
    static let EdgeBody: UInt32 = 0x1 << 3  
}



    
    
