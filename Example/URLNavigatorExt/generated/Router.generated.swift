// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// Create Time: 2020-05-09 13:49:34
import URLNavigatorExt
import URLNavigator

struct ModelPageConfig {
    let desc: String
    let url: String
    let page: URL
    let priority: Int
}

// swiftlint:disable file_length
// swiftlint:disable type_body_length
public enum Router {
    static var urlPages = [String: ModelPageConfig]()

    /// desc: user detail page
    /// view: UserViewController
    /// parameters:
    ///     - name: String 
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
        var name: String

        init(
            name: String
        ) {
            self.name = name
        }

        public static func instance(by queryItem: [String: String]) -> Self? {
            let items = queryItem.map({ ($0.key.lowercased(), $0.value) })
            let dict = [String: String](uniqueKeysWithValues: items)

            let _name: String? = dict["name"]
            guard
                let name = _name
            else { return nil }
            return PRUser_Detail(
                name: name
            )
        }
    }


    static let config = """
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
}
