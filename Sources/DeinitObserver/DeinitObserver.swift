import Foundation

public final class DeinitObserver {
    
    public typealias DidDeinit = () -> Void
    
    private let didDeinit: DidDeinit
    
    public init(didDeinit: @escaping DidDeinit) {
        self.didDeinit = didDeinit
    }
    
    deinit {
        didDeinit()
    }
    
    public func observe(_ object: AnyObject) {
        objc_setAssociatedObject(
            object,
            key(of: object),
            self,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }
    
    private func key(of object: AnyObject) -> String {
        String(describing: Unmanaged<AnyObject>.passUnretained(object).toOpaque())
    }
    
}
