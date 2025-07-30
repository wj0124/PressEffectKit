//
//  DelayedBorderButtonStyle.swift
//  PressEffectKit
//
//  Created by 王杰 on 2025/7/30.
//

import SwiftUI
import Combine

// MARK: - 样式本体

public struct DelayedBorderButtonStyle: ButtonStyle {
    public let configuration: PressButtonStyleConfiguration

    public init(configuration: PressButtonStyleConfiguration) {
        self.configuration = configuration
    }

    public func makeBody(configuration: Configuration) -> some View {
        DelayedBorderButtonView(configuration: configuration, style: self.configuration)
    }

    private struct DelayedBorderButtonView: View {
        let configuration: ButtonStyle.Configuration
        let style: PressButtonStyleConfiguration

        @State private var showHighlight = false

        var body: some View {
            configuration.label
                .padding(style.padding)
            

            /// 使用 `.opacity(...)` 控制边框透明度，而不是切换 `.stroke(... ? color : .clear)`，原因如下：
            ///
            /// - ✅ 支持动画流畅度：透明度支持连续插值，颜色切换会断崖式跳变
            /// - ✅ 动画兼容性强：`withAnimation` 可平滑过渡，`.clear` 无法动画化
            /// - ✅ 渲染效率高：仅创建一次图层，通过 GPU 控制透明度，避免视图 diff 抖动
            /// - ✅ 系统行为一致：与 SwiftUI 官方 `.bordered` 风格一致，行为可预测
            /// - ✅ 多动画组合友好：可与 scale、rotation 等叠加使用，避免 mutation warning
                .overlay(
                    RoundedRectangle(cornerRadius: style.cornerRadius)
                       // .trim(from: 0, to: showHighlight ? 1 : 0)
                        .stroke(style.borderColor, lineWidth: style.borderWidth)
                        .opacity(showHighlight ? 1 : 0)
                )
            
                .contentShape(RoundedRectangle(cornerRadius: style.cornerRadius))
                .onChange(of: configuration.isPressed) { pressed in
                    if pressed {
                        withAnimation { showHighlight = true }
                    } else if showHighlight {
                        DispatchQueue.main.asyncAfter(deadline: .now() + style.highlightDuration) {
                            withAnimation { showHighlight = false }
                        }
                    }
                }
        }
    }
}

// MARK: - 语法糖补全支持

public extension ButtonStyle where Self == DelayedBorderButtonStyle {
    
    /// 延迟显示边框的按钮样式（默认配置）
    static var pressBordered: Self {
        DelayedBorderButtonStyle(configuration: .default)
    }

    /// 延迟显示边框按钮样式（无圆角）
    static var pressBorderedSharp: Self {
        DelayedBorderButtonStyle(configuration: .init(
            highlightDuration: 0.5,
            borderColor: .gray,
            borderWidth: 0.5,
            cornerRadius: 0, // ✅ 无圆角
            padding: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        ))
    }
    
    /// 延迟显示边框的按钮样式（自定义配置）
    static func pressBordered(_ configuration: PressButtonStyleConfiguration) -> Self {
        DelayedBorderButtonStyle(configuration: configuration)
    }
}

// MARK: - 预览 Demo

private struct DelayedBorderButtonStyle_Preview: View {
    var body: some View {
        VStack(spacing: 30) {
            Button("默认样式") {}
                .buttonStyle(.pressBordered)
            
            Button("无圆角样式") {}
                .buttonStyle(.pressBorderedSharp)

            Button("自定义样式") {}
                .buttonStyle(.pressBordered(.init(
                    highlightDuration: 0.5,
                    borderColor: .red,
                    borderWidth: 1,
                    cornerRadius: 12,
                    padding: EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
                )))
        }
        .padding()
    }
}

#Preview("DelayedBorderButtonStyle 预览") {
    DelayedBorderButtonStyle_Preview()
}
