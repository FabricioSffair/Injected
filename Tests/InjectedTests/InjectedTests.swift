import XCTest
@testable import Injected

private struct TestInjectedValues: InjectionKey {
    static var currentValue: String = ""
}

private extension InjectedValues {
    var testValue: String {
        get { Self[TestInjectedValues.self] }
        set { Self[TestInjectedValues.self] = newValue }
    }
}

final class InjectedTests: XCTestCase {

    func testInjectedPropertyWrapper() {
        @Injected(\.testValue) var testValue

        XCTAssertEqual(testValue, "")

        testValue = "Updated String"

        XCTAssertEqual(testValue, "Updated String")
    }

}
