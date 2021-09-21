import Foundation

public final class DeinitObserver<Target> where Target: AnyObject {
    
    public typealias DidDeinit = () -> Void
    
    private weak var target: Target?
    
    private let didDeinit: DidDeinit
        
    public init(for target: Target, didDeinit: @escaping DidDeinit) {
        self.target = target
        self.didDeinit = didDeinit
    }
    
    deinit {
        didDeinit()
    }
    
    public func observe() {
        guard let target = target else {
            return
        }
        
        objc_setAssociatedObject(
            target,
            key(of: target),
            self,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }
    
    private func key(of object: Target) -> String {
        String(describing: Unmanaged<AnyObject>.passUnretained(object).toOpaque())
    }
    
}
