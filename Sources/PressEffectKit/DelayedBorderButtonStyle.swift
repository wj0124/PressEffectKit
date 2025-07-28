//
//  DelayedBorderButtonStyle.swift
//  PressEffectKit
//
//  Created by 王杰 on 2025/7/25.
//

import SwiftUI
import Combine

/// 延迟显示边框高亮的按钮样式（兼容 iOS 13）
public struct DelayedBorderButtonStyle: ButtonStyle {
    
    public let configuration: PressButtonStyleConfiguration

    public init(configuration: PressButtonStyleConfiguration) {
        self.configuration = configuration
    }

    public func makeBody(configuration: Configuration) -> some View {
        DelayedBorderButtonView(
            configuration: configuration,
            styleConfig: self.configuration
        )
    }

    private struct DelayedBorderButtonView: View {
        let configuration: Configuration
        let styleConfig: PressButtonStyleConfiguration

        @State private var showHighlight = false

        var body: some View {
            configuration.label
                .padding(styleConfig.padding)
                .overlay(

                    RoundedRectangle(cornerRadius: styleConfig.cornerRadius)
                        .stroke(showHighlight ? styleConfig.borderColor : Color.clear, lineWidth: styleConfig.borderWidth)
                )

                .contentShape(RoundedRectangle(cornerRadius: styleConfig.cornerRadius))

                .onReceive(Just(configuration.isPressed)) { pressed in
                    if pressed {
                        showHighlight = true
                    } else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + styleConfig.highlightDuration) {
                            showHighlight = false
                        }
                    }
                }

        }
    }
}

// MARK: - 测试预览视图

struct DelayedBorderTestPreview: View {
    let duration: TimeInterval

    init(duration: TimeInterval = 0.15) {
        self.duration = duration
    }

    var body: some View {
        VStack(spacing: 20) {
            Button("Hello, Border") {}
                .buttonStyle(
                    DelayedBorderButtonStyle(
                        configuration: PressButtonStyleConfiguration(
                            highlightDuration: duration,
                            borderColor: .blue,
                            borderWidth: 2,
                            cornerRadius: 8,
                            padding: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                           
                        )
                    )
                )
        }
        .padding()
    }
}

#Preview("默认延迟") {
    DelayedBorderTestPreview()
}

#Preview("高亮 0.5 秒") {
    DelayedBorderTestPreview(duration: 0.5)
}
