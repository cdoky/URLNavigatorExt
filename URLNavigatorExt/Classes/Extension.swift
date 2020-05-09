import URLNavigator

extension Navigator {
    /// Description
    ///
    /// - Parameters:
    ///   - navigator: navigator
    ///   - routers: key: namespace://host/path
    public static func register(_ navigator: NavigatorType, routers: [String: Parameterible.Type?]) {
        for (url, param) in routers {
            // 只能通过push, present,
            navigator.register(url, self.ViewControllerFactory(navigator: navigator, parameterible: param))
        }
    }

    /// ViewControllerFactory
    ///
    /// - Parameters:
    ///   - navigator: navigator
    ///   - parameterible: parameterible type
    /// - Returns: ViewControllerFactory
    private static func ViewControllerFactory(navigator: NavigatorType, parameterible: Parameterible.Type?) ->ViewControllerFactory {
        return { url, values, context in
            guard let url = url.urlValue else { return nil }
            guard let scheme = url.scheme,
                let host = url.host else {
                    print("\n//====================================")
                    print("|Error: schme and host can't be nil, check your scheme, cannot contain special symbols|")
                    print("|eg: iosapp://yourhost/page/a?p1=1&p2=2|")
                    print("//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")
                    return nil
            }
            var parameter: Parameterible? = nil;
            if url.queryParameters.count != 0 {
                parameter = (parameterible ?? DefaultParameter.self).instance(by: url.queryParameters)
            } else {
                parameter = context as? Parameterible
            }

            let controller = instance("\(scheme).\(host)", navigator: navigator, parameter: parameter)
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
    public class func instance(_ fullPath: String,
                  navigator: NavigatorType!,
                  parameter: Parameterible?) -> UIViewController? {
        guard let clazz = NSClassFromString("\(fullPath)") as? Navigatorible.Type else {
            return nil;
        }
        var viewController = clazz.init(navigator: navigator, parameterible: parameter)
        viewController.navigator = navigator
        return viewController as? UIViewController
    }

    /// return Parameterible instance
    ///
    /// - Parameters:
    ///   - classStr: 参数类型全路径
    ///   - queryItem: 参数字典
    /// - Returns: 参数对象实例
    public class func instance(_ classStr: String, queryItem: [String: String]) -> Parameterible? {
        guard let clazz = NSClassFromString("\(classStr)") as? Parameterible.Type else {
            return nil;
        }
        return clazz.instance(by: queryItem);
    }

}

// MARK: - 扩展NavigatorType
extension NavigatorType {

    /// pop
    ///
    /// - Parameter animated: default is true
    /// - Returns: Returns the popped controller.
    @discardableResult
    public func pop(animated: Bool = true) -> UIViewController? {
        return UIViewController.topMost?.navigationController?.popViewController(animated: animated)
    }

    /// popToRoot
    ///
    /// - Parameter animated: default is true
    /// - Returns: Returns the popped controller.
    @discardableResult
    public func popToRoot(animated: Bool = true) -> [UIViewController]? {
        return UIViewController.topMost?.navigationController?.popToRootViewController(animated: animated)
    }

    /// popToViewController
    /// - Parameters:
    ///   - viewController: the target viewcontroller
    ///   - animated: default is true
    /// - Returns: Returns the popped controller.
    @discardableResult
    public func popToViewController(_ viewController: UIViewController,
                                    animated: Bool = true) -> [UIViewController]? {
        return UIViewController.topMost?.navigationController?.popToViewController(viewController, animated: animated)
    }
}
