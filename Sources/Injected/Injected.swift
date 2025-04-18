//
//  Injected.swift
//
//  Created by Fabricio  on 2023-01-03.
//

@propertyWrapper
public struct Injected<T> {

    private let keyPath: WritableKeyPath<InjectedValues, T>

    public var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }

    public init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}
