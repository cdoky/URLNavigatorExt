//
//  Navigatorible.swift
//  Pods
//
//  Created by phil on 2019/11/26.
//

import URLNavigator

/// Navigatorible
public protocol Navigatorible {
    /// 导航器，如果是使用navigator.push跳转的页面，则不需要手动赋值，否则需要手动赋值
    var navigator: NavigatorProtocol! { get set }
    /// 初始化协议
    ///
    /// - Parameters:
    ///   - navigator: 导航对象
    ///   - parameterible: 参数对象
    ///   - values: 参数对象
    init(navigator: NavigatorProtocol, parameterible: Parameterible?)
}
