# DeinitObserver

Observe object's deinit from outside of object

## 🚀 Motivation
* I want to observe deinit of target object, but there are cases where I can't implement deinit. Therefore, I made `DeinitObserver`.
* [Swift 객체 외부에서 객체가 해제되는 것 감지하기](https://cozzin.github.io/2021/03/30/DeallocWatcher.html)

## 🧰 Setup
1. In your Xcode project, navigate to File > Swift Packages > Add Package Dependancy...
2. Paste the following into the URL field: https://github.com/cozzin/DeinitObserver

## 🧑‍💻 Usage
```swift
import DeinitObserver

DeinitObserver(for: target) {
    print("target did deinit!")
}.observe()
```
