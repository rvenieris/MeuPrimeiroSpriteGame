//
//  GameScene.swift
//  MeuPrimeiroSpriteGame
//
//  Created by Ricardo Venieris on 02/04/22.
//

import SpriteKit

class GameScene: SKScene {

    private var vermelin : SKShapeNode = {
        let vermelin = SKShapeNode(circleOfRadius: 100)
        vermelin.fillColor = .red
        return vermelin
    }()
    
    let cores:[UIColor] = [.red, .blue, .brown, .cyan, .darkGray, .green, .purple, .yellow, .systemPink]
    
    var colorIndex:Int = 0
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        
        self.addChild(vermelin)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touche = touches.first else {
            print("tem tuche nenhum aqui")
            return
        }
        let location = touche.location(in: self)
        
        guard let node = self.nodes(at: location).first else {
            let action = SKAction.move(to: location, duration: 2)
            vermelin.run(action)
            return
        }
        
        guard let shape = node as? SKShapeNode else {
            print("esse trem não é um shape")
            return
        }
        
        colorIndex += 1
        colorIndex = colorIndex % cores.count
        shape.fillColor = cores[colorIndex]
        
        let novaDistncia = CGVector(dx: Int.random(in: -30...30),
                                   dy: Int.random(in: -30...30))
        
        let action = SKAction.move(by: novaDistncia,
                                   duration: 1)
        
        shape.run(action)

        
    }
    
    

}

