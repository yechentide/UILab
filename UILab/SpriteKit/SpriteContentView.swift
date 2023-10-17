//
//  ContentView.swift
//  Created on 2023/02/26.
//

import SwiftUI
import SpriteKit

struct SpriteContentView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .black
        return scene
    }

    var body: some View {
        SpriteView(
            scene: scene,
            options: [
                .allowsTransparency,
            ],
            debugOptions: [
                .showsFPS,
                .showsNodeCount,
                .showsDrawCount
            ])
    }
}

#Preview {
    SpriteContentView()
}
