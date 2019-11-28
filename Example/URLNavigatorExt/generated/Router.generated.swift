// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// Create Time: 2019-11-28 11:23:08
import URLNavigatorExt
import URLNavigator

struct ModelPageConfig {
    let desc: String
    let url: String
    let page: URL
    let priority: Int
}

// swiftlint:disable file_length
public enum Router {
    static var urlPages = [String: ModelPageConfig]()

    /// desc: 第一个viewController
    /// view: ViewController
    /// parameters:
    ///     - blk: (()->Void)? 
    ///     - p7: Int64 
    ///     - p6: Test2Enum default: .d
    ///         - c: 100
    ///         - d: 101
    ///     - p5: Test2Enum? default: .c
    ///         - c: 100
    ///         - d: 101
    ///     - p4: String? 
    ///     - p3: String? default: abc123
    ///     - type1: TestEnum? default: .b
    ///         - a: a
    ///         - b: b
    ///     - type: TestEnum default: .a
    ///         - a: a
    ///         - b: b
    public static let home_page = "\(Scheme.domain)/home"

    /// desc: ViewController01
    /// view: ViewController01
    /// parameters:
    ///     - None
    public static let page01 = "\(Scheme.domain)/page01"

    /// desc: ViewController02
    /// view: ViewController02
    /// parameters:
    ///     - name: String default: 这是一个测试参数
    ///     - uid: Int64 default: 0
    public static let page02 = "\(Scheme.domain)/page02"

    /// MARK: parameter type dic
    static let urlParas: [String: Parameterible.Type?] = [
        Router.home_page: Router.PRHome_page.self,
        Router.page01: nil,
        Router.page02: Router.PRPage02.self
    ]

    /// desc: 第一个viewController
    /// view: ViewController
    /// path: /home
    /// name: home_page
    public struct PRHome_page: Parameterible {
        var blk: (()->Void)?
        var p7: Int64
        var p6: Test2Enum
        var p5: Test2Enum?
        var p4: String?
        var p3: String?
        var type1: TestEnum?
        var type: TestEnum

        init(
            type: TestEnum,
            p6: Test2Enum,
            p7: Int64,
            type1: TestEnum?,
            p3: String?,
            p4: String?,
            p5: Test2Enum?,
            blk: (()->Void)?
        ) {
            self.blk = blk
            self.p7 = p7
            self.p6 = p6
            self.p5 = p5
            self.p4 = p4
            self.p3 = p3
            self.type1 = type1
            self.type = type
        }

        public static func instance(by queryItem: [String: String]) -> Self? {
            let items = queryItem.map({ ($0.key.lowercased(), $0.value) })
            let dict = [String: String](uniqueKeysWithValues: items)
            var _type: TestEnum? = .a
            if let value = dict["type"]{
                if let _enum = TestEnum(rawValue: value) {
                    _type = _enum
                }
            }
            var _p6: Test2Enum? = .d
            if let value = dict["p6"]{
                if let _value = Int(value), let _enum = Test2Enum(rawValue: _value) {
                    _p6 = _enum
                }
            }
            var _p7: Int64? = nil
            if let value = dict["p7"]{
                _p7 = Int64(value)
            }
            var type1: TestEnum? = .b
            if let value = dict["type1"]{
                if let _enum = TestEnum(rawValue: value) {
                    type1 = _enum
                }
            }
            var p3: String? = "abc123"
            if let value = dict["p3"]{
                p3 = value
            }
            var p4: String? = ""
            if let value = dict["p4"]{
                p4 = value
            }
            var p5: Test2Enum? = .c
            if let value = dict["p5"]{
                if let _value = Int(value), let _enum = Test2Enum(rawValue: _value) {
                    p5 = _enum
                }
            }
            guard 
                let type = _type,
                let p6 = _p6,
                let p7 = _p7
            else { return nil}
            return PRHome_page(
                type: type,
                p6: p6,
                p7: p7,
                type1: type1,
                p3: p3,
                p4: p4,
                p5: p5,
                blk: nil
            )
        }
    }

    /// desc: ViewController02
    /// view: ViewController02
    /// path: /page02
    /// name: page02
    public struct PRPage02: Parameterible {
        var name: String
        var uid: Int64

        init(
            uid: Int64,
            name: String
        ) {
            self.name = name
            self.uid = uid
        }

        public static func instance(by queryItem: [String: String]) -> Self? {
            let items = queryItem.map({ ($0.key.lowercased(), $0.value) })
            let dict = [String: String](uniqueKeysWithValues: items)
            var _uid: Int64? = 0
            if let value = dict["uid"]{
                _uid = Int64(value)
            }
            var _name: String? = "这是一个测试参数"
            if let value = dict["name"]{
                _name = value
            }
            guard 
                let uid = _uid,
                let name = _name
            else { return nil}
            return PRPage02(
                uid: uid,
                name: name
            )
        }
    }


    static let config = """
        {
            "router": [
                {
                    "desc": "第一个viewController",
                    "path": "/home",
                    "page": "ViewController",
                    "priority": 1
                },
                {
                    "desc": "ViewController01",
                    "path": "/page01",
                    "page": "ViewController01",
                    "priority": 1
                },
                {
                    "desc": "ViewController02",
                    "path": "/page02",
                    "page": "ViewController02",
                    "priority": 1
                }
            ]
        }  
    """
}