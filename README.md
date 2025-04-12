# Injected 🎯

A lightweight, type-safe dependency injection framework for Swift that leverages property wrappers and key paths. Inspired by SwiftUI's environment values pattern, `Injected` provides a clean and intuitive way to manage dependencies in your Swift applications.

## Features ✨

- 🔒 Type-safe dependency injection
- 🎯 Property wrapper-based syntax for clean dependency declaration
- 🧩 Easy to extend and customize
- 📦 Zero external dependencies
- 🏃‍♂️ Minimal runtime overhead
- 💻 Swift Package Manager support

## Installation 📥

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/fabriciosffair/Injected.git", from: "1.0.0")
]
```

## Usage 🚀

### 1. Define Your Dependencies

First, create an injection key for your dependency:

```swift
private struct NetworkServiceKey: InjectionKey {
    static var currentValue: NetworkServiceProtocol = NetworkService()
}
```

### 2. Extend InjectedValues

Add your dependency to the `InjectedValues`:

```swift
extension InjectedValues {
    var networkService: NetworkServiceProtocol {
        get { Self[NetworkServiceKey.self] }
        set { Self[NetworkServiceKey.self] = newValue }
    }
}
```

### 3. Use the Dependency

Use the `@Injected` property wrapper to access your dependency:

```swift
class UserViewModel {
    @Injected(\.networkService) private var networkService
    
    func fetchUser() async throws -> User {
        try await networkService.fetchUser()
    }
}
```

### 4. Override Dependencies (for testing)

Easily override dependencies for testing:

```swift
final class UserViewModelTests: XCTestCase {
    func testFetchUser() async throws {
        // Arrange
        let mockNetworkService = MockNetworkService()
        InjectedValues[\.networkService] = mockNetworkService
        
        let viewModel = UserViewModel()
        
        // Act & Assert
        // ... your test code
    }
}
```

## Advanced Usage 🔧

### Custom Dependency Containers

You can create custom dependency containers for different scopes:

```swift
struct FeatureContainer {
    @Injected(\.networkService) var networkService
    @Injected(\.analyticsService) var analyticsService
    
    // Additional dependencies...
}
```

### Lazy Injection

Dependencies are resolved only when accessed, providing efficient memory usage:

```swift
class ViewModel {
    @Injected(\.heavyService) private var heavyService: HeavyServiceProtocol
    
    // heavyService is only initialized when first accessed
}
```

## Best Practices 📚

1. **Protocol-Based Dependencies**: Always inject protocols rather than concrete types:
```swift
protocol ServiceProtocol { /* ... */ }
struct ServiceKey: InjectionKey {
    static var currentValue: ServiceProtocol = Service()
}
```

2. **Testing**: Create mock implementations of your protocols for testing:
```swift
class MockService: ServiceProtocol {
    // Mock implementation
}
```

3. **Default Values**: Provide sensible default implementations in your injection keys:
```swift
struct LoggerKey: InjectionKey {
    static var currentValue: Logger = ConsoleLogger()
}
```

## Requirements 📋

- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+
- Swift 5.5+
- Xcode 13.0+

## Contributing 🤝

Contributions are welcome! Please feel free to submit a Pull Request.

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author ✍️

[Your Name]

## Acknowledgments 🙏

Inspired by SwiftUI's Environment Values pattern and the Swift community's best practices for dependency injection.
