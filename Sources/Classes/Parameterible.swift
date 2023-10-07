//
//  Parameterible.swift
//  Pods
//
//  Created by phil on 2019/11/26.
//

/// 页面参数
public protocol Parameterible {
    static func instance(by queryItem: [String: Any]) -> Self?
    var queries: [String: Any] { get }
}

/// 页面参数复杂类型
public protocol Typeible {
    static func instance(from value: Any?) -> Self?
    static func list(from value: Any?) -> [Self]?
}

/// 默认参数类型
public struct DefaultParameter: Parameterible {
    public var queries: [String : Any] {
        return self.items
    }
    public static func instance(by queryItem: [String : Any]) -> Self? {
        let ins = DefaultParameter(items: queryItem)
        return ins
    }
    public let items: [String: Any]
}
