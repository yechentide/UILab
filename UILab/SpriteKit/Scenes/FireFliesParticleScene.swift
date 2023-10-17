//
//  ParticleScene01.swift
//  Created on 2023/02/26.
//

import SpriteKit

class FireFliesParticleScene: SKScene {
    let snowEmitterNode = SKEmitterNode(fileNamed: "FireFliesParticle.sks")

    override func didMove(to view: SKView) {
        if let snowEmitterNode = snowEmitterNode {
            snowEmitterNode.particleSize = CGSize(width: 30, height: 30)
            snowEmitterNode.particleLifetime = 5
            snowEmitterNode.particleLifetimeRange = 10
            self.addChild(snowEmitterNode)
        }
    }

    override func didChangeSize(_ oldSize: CGSize) {
        guard let snowEmitterNode = snowEmitterNode else { return }
        snowEmitterNode.particlePosition = CGPoint(x: size.width/2, y: size.height)
        snowEmitterNode.particlePositionRange = CGVector(dx: size.width, dy: size.height)
    }
}
