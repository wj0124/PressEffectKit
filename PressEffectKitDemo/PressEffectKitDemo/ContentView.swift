//
//  ContentView.swift
//  PressEffectKitDemo
//
//  Created by 王杰 on 2025/7/25.
//

import SwiftUI
import PressEffectKit

struct ContentView: View {
    /// 通用样式配置
    @State private var styleConfig = PressButtonStyleConfiguration()

    var body: some View {
        VStack(spacing: 32) {

            // 按钮预览
            Button("点我") {}
                .buttonStyle(DelayedBorderButtonStyle(configuration: styleConfig))

            // 控制面板
            controlPanel
        }
        .padding()
    }

    /// 控制面板 UI
    private var controlPanel: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Corner Radius")
                Spacer()
                Slider(value: $styleConfig.cornerRadius, in: 0...20, step: 1)
                Text("\(styleConfig.cornerRadius, specifier: "%.0f")")
                    .frame(width: 40)
            }

            ColorPicker("Border Color", selection: $styleConfig.borderColor)

            HStack {
                Text("Padding")
                Spacer()
                Slider(value: $styleConfig.padding, in: 0...30, step: 1)
                Text("\(styleConfig.padding, specifier: "%.0f")")
                    .frame(width: 40)
            }

            HStack {
                Text("Highlight Duration")
                Spacer()
                Slider(value: $styleConfig.highlightDuration, in: 0...1, step: 0.05)
                Text("\(styleConfig.highlightDuration, specifier: "%.2f")s")
                    .frame(width: 60)
            }

            HStack {
                Text("Border Width")
                Spacer()
                Slider(value: $styleConfig.borderWidth, in: 1...10, step: 0.5)
                Text("\(styleConfig.borderWidth, specifier: "%.1f")")
                    .frame(width: 60)
            }

            Divider()

            HStack {
                Spacer()
                Button("重置") {
                    resetAll()
                }
                Spacer()
            }
        }
        
    }

    /// 重置配置
    private func resetAll() {
        styleConfig = PressButtonStyleConfiguration()
    }
}

#Preview {
    ContentView()
    Spacer()
}
