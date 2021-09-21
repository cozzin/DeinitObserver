import XCTest
@testable import DeinitObserver

final class TargetObject { }

final class DeinitObserverTests: XCTestCase {
    
    var didDeinit: Bool = false
    var givenObject: TargetObject!
    
    override func setUp() {
        didDeinit = false
        givenObject = TargetObject()
    }

    func test_givenObjectDeinit() {
        // given
        DeinitObserver { [weak self] in
            self?.didDeinit = true
        }.observe(givenObject)
        
        // when
        givenObject = nil
        
        // then
        XCTAssertTrue(didDeinit)
    }
    
    func test_givenObjectDidNotDeinit() {
        // given
        DeinitObserver { [weak self] in
            self?.didDeinit = true
        }.observe(givenObject)
        
        // then
        XCTAssertFalse(didDeinit)
    }
    
}
