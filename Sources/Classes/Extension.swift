import Foundation
import UIKit
import URLNavigator

public extension Navigator {
    /// Description
    ///
    /// - Parameters:
    ///   - navigator: navigator
    ///   - routers: key: namespace://host/path
    static func register(
        _ navigator: NavigatorType,
        routers: [String: Parameterible.Type?])
    {
        routers.forEach { url, param in
            navigator.register(
                url,
                ViewControllerFactory(
                    parameterible: param))
        }
    }

    /// ViewControllerFactory
    ///
    /// - Parameters:
    ///   - navigator: navigator
    ///   - parameterible: parameterible type
    /// - Returns: ViewControllerFactory
    private static func ViewControllerFactory(
        parameterible: Parameterible.Type?) -> ViewControllerFactory
    {
        return { url, _, context in
            guard let url = url.urlValue else { return nil }
            guard let scheme = url.scheme,
                  let host = url.host
            else {
                print("\n//====================================")
                print("|Error: schme and host can't be nil, check your scheme, cannot contain special symbols|")
                print("|eg: iosapp://yourhost/page/a?p1=1&p2=2|")
                print("//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")
                return nil
            }
            var parameter: Parameterible?
            if url.queryParameters.count != 0 {
                parameter = (parameterible ?? DefaultParameter.self).instance(by: url.queryParameters)
            } else {
                parameter = context as? Parameterible
            }

            let controller = instance("\(scheme).\(host)", parameter: parameter)
            return controller
        }
    }

    /// return Navigatorible instance
    ///
    /// - Parameters:
    ///   - fullPath: 全路径(eg: URLNavigatorExt_Example.ViewController)
    ///   - navigator: navigator实例
    ///   - parameter: 参数
    /// - Returns: UIViewController
    class func instance(
        _ fullPath: String,
        parameter: Parameterible?) -> UIViewController?
    {
        guard let clazz = NSClassFromString("\(fullPath)") as? Navigatorible.Type else {
            return nil
        }
        return clazz.init(parameterible: parameter) as? UIViewController
    }

    /// return Parameterible instance
    ///
    /// - Parameters:
    ///   - classStr: 参数类型全路径
    ///   - queryItem: 参数字典
    /// - Returns: 参数对象实例
    class func instance(_ classStr: String, queryItem: [String: String]) -> Parameterible? {
        guard let clazz = NSClassFromString("\(classStr)") as? Parameterible.Type else {
            return nil
        }
        return clazz.instance(by: queryItem)
    }
}

// MARK: - 扩展NavigatorType

public extension NavigatorType {
    var topMostNavigation: UINavigationController? {
        UIViewController.topMost?.navigationController
    }

    /// pop
    ///
    /// - Parameter animated: default is true
    /// - Returns: Returns the popped controller.
    @discardableResult
    func pop(animated: Bool = true) -> UIViewController? {
        return topMostNavigation?.popViewController(animated: animated)
    }

    /// popToRoot
    ///
    /// - Parameter animated: default is true
    /// - Returns: Returns the popped controller.
    @discardableResult
    func popToRoot(animated: Bool = true) -> [UIViewController]? {
        return topMostNavigation?.popToRootViewController(animated: animated)
    }

    /// popToViewController
    /// - Parameters:
    ///   - viewController: the target viewcontroller
    ///   - animated: default is true
    /// - Returns: Returns the popped controller.
    @discardableResult
    func popToViewController(
        _ viewController: UIViewController,
        animated: Bool = true) -> [UIViewController]?
    {
        return topMostNavigation?.popToViewController(viewController, animated: animated)
    }
}
