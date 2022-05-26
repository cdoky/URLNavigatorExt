//
//  Navigatorible.swift
//  Pods
//
//  Created by phil on 2019/11/26.
//

import URLNavigator

/// Navigatorible
public protocol Navigatorible {
    /// 初始化协议
    ///
    /// - Parameters:
    ///   - navigator: 导航对象
    ///   - parameterible: 参数对象
    ///   - values: 参数对象
    init(parameterible: Parameterible?)
}
