//
//  Parameterible.swift
//  Pods
//
//  Created by phil on 2019/11/26.
//

/// 页面参数
public protocol Parameterible {
    static func instance(by queryItem: [String: String]) -> Self?
}

/// 页面参数复杂类型
public protocol Typeible {
    static func instance(from value: String?) -> Self?
    static func list(from value: String?) -> [Self]?
}

/// 默认参数类型
public struct DefaultParameter: Parameterible {
    public static func instance(by queryItem: [String : String]) -> DefaultParameter? {
        let ins = DefaultParameter(items: queryItem)
        return ins
    }
    public let items: [String: String]
}
