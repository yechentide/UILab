//
// UILabWidgetLiveActivity.swift
// Created on 2023/09/29
//

import ActivityKit
import WidgetKit
import SwiftUI

struct UILabWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct UILabWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: UILabWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension UILabWidgetAttributes {
    fileprivate static var preview: UILabWidgetAttributes {
        UILabWidgetAttributes(name: "World")
    }
}

extension UILabWidgetAttributes.ContentState {
    fileprivate static var smiley: UILabWidgetAttributes.ContentState {
        UILabWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: UILabWidgetAttributes.ContentState {
         UILabWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: UILabWidgetAttributes.preview) {
   UILabWidgetLiveActivity()
} contentStates: {
    UILabWidgetAttributes.ContentState.smiley
    UILabWidgetAttributes.ContentState.starEyes
}
