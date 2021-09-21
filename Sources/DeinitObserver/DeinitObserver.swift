import Foundation

final class DeinitObserver {
    
    typealias DidDeinit = () -> Void
    
    private let didDeinit: DidDeinit
    
    init(didDeinit: @escaping DidDeinit) {
        self.didDeinit = didDeinit
    }
    
    deinit {
        didDeinit()
    }
}
