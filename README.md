# DeinitObserver

Observe object's deinit from outside of object

## π Motivation
* I want to observe deinit of target object, but there are cases where I can't implement deinit. Therefore, I made `DeinitObserver`.
* [Swift κ°μ²΄ μΈλΆμμ κ°μ²΄κ° ν΄μ λλ κ² κ°μ§νκΈ°](https://cozzin.github.io/2021/03/30/DeallocWatcher.html)

## π§° Setup
1. In your Xcode project, navigate to File > Swift Packages > Add Package Dependancy...
2. Paste the following into the URL field: https://github.com/cozzin/DeinitObserver

## π§βπ» Usage
```swift
import DeinitObserver

DeinitObserver(for: target) {
    print("target did deinit!")
}.observe()
```
