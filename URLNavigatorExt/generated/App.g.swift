// Generated using Sourcery 2.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// Create Time: 2023-10-07 12:33:16
import URLNavigator
import URLNavigatorExt
fileprivate let modelName = "iOSApp"

//public extension Mediator {
//    /// 注册模块
//    func installiOSApp() {
//        self.registered(
//            self.mediator.PageInfo,
//            parameters: self.mediator.parameter)
//    }
//    
//    private var mediator: R_iOSApp {
//        return R_iOSApp()
//    }
//}

public class R_iOSApp {
    fileprivate init() {
        
    }
    // =================generated path======================
    /// desc: user detail page
    /// view: UserViewController
    /// parameters:
    ///     - sex: Sex? 
    ///         - unknow: 0
    ///         - male: 1
    ///         - famale: 2
    ///     - name: String 
    ///     - code: Int? 
    public static let user_detail = "/user/detail"

}

/// 参数数据结构
public extension R_iOSApp {
    /// desc: user detail page
    /// view: UserViewController
    /// path: /user/detail
    /// name: user_detail
    struct PRUser_Detail: Parameterible {
        public var sex: Sex?
        public var name: String
        public var code: Int?
        public fileprivate (set) var queries: [String: Any] = [:]

        public init(
            name: String,
            code: Int? = nil,
            sex: Sex? = nil
        ) {
            self.sex = sex
            if let v = sex {
                self.queries["sex"] = String(describing: v.rawValue)
            }
            self.name = name
            self.queries["name"] = String(describing: name)
            self.code = code
            if let v = code {
                self.queries["code"] = String(describing: v)
            }
        }

        public static func instance(by queryItem: [String: Any]) -> Self? {
            let items = queryItem.map({ ($0.key.lowercased(), $0.value) })
            let dict = [String: Any](uniqueKeysWithValues: items)

            let _name = dict["name"] as? String

            var code: Int?
            if let value = dict["code"] as? String {
                code = Int(value)
            }

            var sex: Sex?
            if let value = dict["sex"] as? String {
                if let _value = Int(value), let _enum = Sex(rawValue: _value) {
                    sex = _enum
                }
            }
            guard
                let name = _name
            else { return nil }
            return PRUser_Detail(
                name: name,
                code: code,
                sex: sex
            )
        }
    }

}

extension R_iOSApp {
    fileprivate var parameter: [String: Parameterible.Type?] {
        return [
        Self.user_detail: Self.PRUser_Detail.self
        ]
    }
    
    fileprivate var PageInfo: String {
        return """
        {
            "router": [
                {
                    "desc": "user detail page",
                    "path": "/user/detail",
                    "page": "iOSApp.UserViewController",
                    "isFlutter": false,
                    "priority": 1
                }
            ]
        }
    """
    }
}
