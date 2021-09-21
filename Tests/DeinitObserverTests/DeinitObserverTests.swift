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
        DeinitObserver(for: givenObject) { [weak self] in
            self?.didDeinit = true
        }.observe()
        
        // when
        givenObject = nil
        
        // then
        XCTAssertTrue(didDeinit)
    }
    
    func test_givenObjectDidNotDeinit() {
        // given
        DeinitObserver(for: givenObject) { [weak self] in
            self?.didDeinit = true
        }.observe()
        
        // then
        XCTAssertFalse(didDeinit)
    }
    
}
