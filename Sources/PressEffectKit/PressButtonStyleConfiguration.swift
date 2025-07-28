//
//  PressButtonStyleConfiguration.swift
//  PressEffectKit
//
//  Created by 王杰 on 2025/7/25.
//

import SwiftUI

public struct PressButtonStyleConfiguration {
    public var highlightDuration: TimeInterval
    public var borderColor: Color
    public var borderWidth: CGFloat
    public var cornerRadius: CGFloat
    public var padding: EdgeInsets

    public init(
        highlightDuration: TimeInterval = 0.15,
        borderColor: Color = Color.gray.opacity(0.6),
        borderWidth: CGFloat = 1,
        cornerRadius: CGFloat = 0,
        padding: EdgeInsets = EdgeInsets()
    ) {
        self.highlightDuration = highlightDuration
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.padding = padding
    }
}
