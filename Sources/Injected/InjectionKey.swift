//
//  InjectionKey.swift
//
//  Created by Fabricio  on 2023-01-03.
//

public protocol InjectionKey {
    associatedtype Value

    static var currentValue: Self.Value { get set }
}
