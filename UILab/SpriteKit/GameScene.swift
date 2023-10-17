//
//  GameScene.swift
//  Created on 2023/02/26.
//

import SpriteKit
import SwiftUI

//func getSubChunkView() {
//    let aaa = Color(red: 0.4, green: 0.4, blue: 0.4)
//}

class GameScene: SKScene {
    private let cameraNode = SKCameraNode()

    override func didMove(to view: SKView) {
        self.camera = cameraNode
        cameraNode.position = .init(x: self.frame.midX, y: self.frame.midY)
        self.addChild(cameraNode)

        let originNode = SKShapeNode(circleOfRadius: 5)
        originNode.position = .init(x: 0, y: 0)
        originNode.strokeColor = .red
//        originNode.fillColor = .red
        originNode.zPosition = 100
        self.addChild(originNode)

        let blockSize = CGSize(width: 50, height: 50)
        addBlock(color: .blue, size: blockSize, position: .init(x: 0, y: 0))
        addBlock(color: .green, size: blockSize, position: .init(x: 50, y: 50))
        addBlock(color: .purple, size: blockSize, position: .init(x: 100, y: 100))

        let texture = makeTexture(length: 50)
        addBlock(texture: texture, size: blockSize, position: .init(x: 0, y: 50))
        addBlock(texture: texture, size: blockSize, position: .init(x: 50, y: 100))
    }

    private func addBlock(color: UIColor, size: CGSize, position: CGPoint) {
        let block = SKSpriteNode(color: color, size: size)
        block.anchorPoint = CGPoint(x: 0, y: 0)
        block.position = position
        self.addChild(block)
    }

    private func makeTexture(length: Int) -> SKTexture {
        let bytes = stride(from: 0, to: length*length, by: 1).flatMap { _ in
            return [
                UInt8(drand48() * 255),
                UInt8(drand48() * 255),
                UInt8(drand48() * 255),
                UInt8(255)
            ]
        }
        return SKTexture(data: Data(bytes), size: CGSize(width: length, height: length))
    }

    private func addBlock(texture: SKTexture, size: CGSize, position: CGPoint) {
        let block = SKSpriteNode(texture: texture, size: size)
        block.anchorPoint = CGPoint(x: 0, y: 0)
        block.position = position
        self.addChild(block)
    }
}
