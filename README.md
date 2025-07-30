# 📦 PressEffectKit

基于 SwiftUI 的延迟边框按钮样式，还原 YouTube App 的按钮按压动效，遵循 Apple 系统 API 的编程风格，支持 `.pressBordered` 等语法糖扩展。

---

## ✨ 特性

- 🎯 延迟显示边框动画，模仿 YouTube App 按钮动效  
- 🍎 遵循 Apple `ButtonStyle` 协议设计风格  
- 🧱 提供 `.pressBordered` / `.pressBorderedSharp` 等语法糖  
- 💡 支持自定义边框颜色、宽度、圆角、内边距、延迟时长    

---

##  使用方式


```swift
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
```
##  安装方式
Swift Package Manager（推荐）
```swift
.package(url: "https://github.com/wj0124/PressEffectKit.git", from: "1.0.0")
```

如果觉得有用欢迎 Star ⭐️！


            
