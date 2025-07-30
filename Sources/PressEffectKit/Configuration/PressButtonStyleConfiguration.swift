//
//  PressButtonStyleConfiguration.swift
//  PressEffectKit
//
//  Created by 王杰 on 2025/7/25.
//
//
import SwiftUI
import Combine

// MARK: - 配置模型

/// 按钮样式配置（边框、圆角、延迟高亮等）
public struct PressButtonStyleConfiguration {
    public let highlightDuration: TimeInterval
    public let borderColor: Color
    public let borderWidth: CGFloat
    public let cornerRadius: CGFloat
    public let padding: EdgeInsets

    public init(
        highlightDuration: TimeInterval = 0.15,
        borderColor: Color = .gray,
        borderWidth: CGFloat = 1,
        cornerRadius: CGFloat = 8,
        padding: EdgeInsets = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    ) {
        self.highlightDuration = highlightDuration
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.padding = padding
    }

    public static var `default`: Self {
        .init()
    }
}
