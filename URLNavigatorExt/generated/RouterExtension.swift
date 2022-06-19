//
//  RouterExtension.swift
//  URLNavigatorExt_Example
//
//  Created by phil on 2019/11/26.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import URLNavigatorExt
import URLNavigator
import SafariServices

public class Scheme {
    static var name: String {
        return String(NSStringFromClass(Scheme.self).split(separator: ".").first!)
    }

    static var domain = "navigator://www.app.com"
}

extension Router {
    public static func registOuterUrl(jsonStr: String, navigator: NavigatorProtocol) {
        guard let dict = try? JSONSerialization.jsonObject(with: jsonStr.data(using: .utf8)!) as? [String: Any],
            let router = dict?["router"] as? [Any]
            else { return }
        for kv in router {
            if let pairs = kv as? [String: Any],
                let url = pairs["path"] as? String,
                let page = pairs["page"] as? String {
                let priority = pairs["priority"] as? Int ?? 1
                if let preConfig = self.urlPages[url], preConfig.priority >= priority && priority < 5 {
                    continue
                }
                let config = Router.PageConfig(desc: pairs["desc"] as? String ?? "", url: url, page: URL(string: "\(Scheme.name)://\(page)")!, priority: priority)

                let fullURL = Scheme.domain + url
                self.urlPages[url] = config
                let para = self.urlParas[fullURL]
                navigator.register(url, self.ViewControllerFactory(navigator: navigator, parameterible: para ?? nil))
                navigator.register(fullURL, self.ViewControllerFactory(navigator: navigator, parameterible: para ?? nil))
            }
        }
        navigator.register("http://<path:_>", self.webViewControllerFactory)
        navigator.register("https://<path:_>", self.webViewControllerFactory)
    }

    /// <#Description#>
    ///
    /// - Parameters:
    ///   - url: <#url description#>
    ///   - values: <#values description#>
    ///   - context: <#context description#>
    /// - Returns: <#return value description#>
    private static func webViewControllerFactory(url: URLConvertible, values: [String: Any], context: Any? ) -> UIViewController? {
        guard let url = url.urlValue else { return nil }
        return SFSafariViewController(url: url)
    }

    /// <#Description#>
    ///
    /// - Parameters:
    ///   - navigator: <#navigator description#>
    ///   - parameterible: <#parameterible description#>
    /// - Returns: <#return value description#>
    private static func ViewControllerFactory(navigator: NavigatorProtocol, parameterible: Parameterible.Type?) -> ViewControllerFactory {
        return { url, values, context in
            guard let url = url.urlValue,
                let ori_scheme = url.scheme,
                let ori_host = url.host
                else { return nil }
            guard let interUrl = self.urlPages[url.path]?.page else {
                return nil
            }
            guard let scheme = interUrl.scheme,
                let host = interUrl.host else {
                    print("\n//=============URLNavigatorExt=======================")
                    print("|URLNavigatorExt: Error: schme and host can't be nil, pz check your scheme, 不能包含特殊符号|")
                    print("//<<<<<<<<<<<<<<<URLNavigatorExt<<<<<<<<<<<<<<<<<<<<<<<<\n")
                    return nil
            }

            var parameter: Parameterible?
            var parameter_type: Parameterible.Type? = parameterible
            if parameter_type == nil {
                let fullURL = "\(ori_scheme)://\(ori_host)\(url.path)"
                if let _parameter_type = self.urlParas[fullURL], _parameter_type != nil {
                    parameter_type = _parameter_type
                } else if parameter_type == nil {
                    parameter_type = DefaultParameter.self
                }
            }
            if !(url.queryParameters.isEmpty) {
                parameter = parameter_type?.instance(by: url.queryParameters)
            } else if let dict = context as? [String: String] {
                parameter = parameter_type?.instance(by: dict)
            } else {
                parameter = context as? Parameterible
            }

            let controller = Navigator.instance("\(scheme).\(host)", parameter: parameter)
            return controller
        }
    }
}

