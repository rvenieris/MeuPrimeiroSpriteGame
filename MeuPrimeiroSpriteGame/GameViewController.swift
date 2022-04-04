//
//  GameViewController.swift
//  MeuPrimeiroSpriteGame
//
//  Created by Ricardo Venieris on 02/04/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let view = self.view as! SKView? else {
            fatalError("Se ferrou")
        }
        
        let scene = GameScene(size: UIScreen.main.bounds.size)
        scene.scaleMode = .aspectFill
        
        view.presentScene(scene)

            
        view.showsFPS = true
        view.showsNodeCount = true
        
    }


}
