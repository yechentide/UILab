//
//  ParticleScene02.swift
//  Created on 2023/02/26.
//

import SpriteKit

class RainParticleScene: SKScene {
    let rainEmitterNode = SKEmitterNode(fileNamed: "RainParticle.sks")

    override func didMove(to view: SKView) {
        if let rainEmitterNode = rainEmitterNode {
            rainEmitterNode.position.y = frame.maxY
            rainEmitterNode.particlePositionRange.dx = frame.width * 2.5
            self.addChild(rainEmitterNode)
        }
    }

    override func didChangeSize(_ oldSize: CGSize) {
        guard let snowEmitterNode = rainEmitterNode else { return }
        snowEmitterNode.particlePosition = CGPoint(x: size.width/2, y: size.height)
        snowEmitterNode.particlePositionRange = CGVector(dx: size.width, dy: size.height)
    }
}
