// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// Create Time: 2022-01-15 17:01:01
import URLNavigatorExt
import URLNavigator

// swiftlint:disable file_length
// swiftlint:disable type_body_length
public enum Router {
    static var urlPages = [String: PageConfig]()

    /// desc: user detail page
    /// view: UserViewController
    /// parameters:
    ///     - sex: Sex? 
    ///         - unknow: 0
    ///         - male: 1
    ///         - famale: 2
    ///     - name: String 
    ///     - code: Int? 
    public static let user_detail = "\(Scheme.domain)/user/detail"

    /// MARK: parameter type dic
    static let urlParas: [String: Parameterible.Type?] = [
        Router.user_detail: Router.PRUser_Detail.self
    ]

    /// desc: user detail page
    /// view: UserViewController
    /// path: /user/detail
    /// name: user_detail
    public struct PRUser_Detail: Parameterible {
        var sex: Sex?
        var name: String
        var code: Int?
        public fileprivate (set) var queries: [String : String] = [:]

        init(
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

        public static func instance(by queryItem: [String: String]) -> Self? {
            let items = queryItem.map({ ($0.key.lowercased(), $0.value) })
            let dict = [String: String](uniqueKeysWithValues: items)

            let _name: String? = dict["name"]

            var code: Int?
            if let value = dict["code"] {
                code = Int(value)
            }

            var sex: Sex?
            if let value = dict["sex"] {
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

    struct PageConfig {
        let desc: String
        let url: String
        let page: URL
        let priority: Int
    }

    static let pageConfigs = """
        {
            "router": [
                {
                    "desc": "user detail page",
                    "path": "/user/detail",
                    "page": "UserViewController",
                    "priority": 1
                }
            ]
        }
    """

    static let flutterRouters = """
        {
            "router": [
            ]
        }
    """
}
