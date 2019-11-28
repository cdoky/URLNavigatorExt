# URLNavigatorExt

[![CI Status](https://img.shields.io/travis/goo.gle@foxmail.com/URLNavigatorExt.svg?style=flat)](https://travis-ci.org/goo.gle@foxmail.com/URLNavigatorExt)
[![Version](https://img.shields.io/cocoapods/v/URLNavigatorExt.svg?style=flat)](https://cocoapods.org/pods/URLNavigatorExt)
[![License](https://img.shields.io/cocoapods/l/URLNavigatorExt.svg?style=flat)](https://cocoapods.org/pods/URLNavigatorExt)
[![Platform](https://img.shields.io/cocoapods/p/URLNavigatorExt.svg?style=flat)](https://cocoapods.org/pods/URLNavigatorExt)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

URLNavigatorExt is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'URLNavigatorExt'
pod 'Sourcery'
```

## Usage
- Build Phases
```shell
"${PODS_ROOT}/Sourcery/bin/sourcery" --prune --sources "${SRCROOT}/${PROJECT_NAME}" --templates "${SRCROOT}/${PROJECT_NAME}/templates" --output "${SRCROOT}/${PROJECT_NAME}/generated"
```

- AppDelegate.swift
```swift
import URLNavigator
import URLNavigatorExt

let navigator = Navigator()

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // ....
    Router.registOuterUrl(jsonStr: Router.config, navigator: navigator)
    // ....
    return true
}
```

- Viewcontroller
    - // sourcery: router: desc="这是页面描述"
    - // sourcery: router: name="这是页面名字"
    - // sourcery: router: path="这是页面的路径 eg: /mine/profile"
    - // sourcery: router: parameter="参数名称:参数类型(自定义类型或数组，需要实现`Typeible`协议):默认值"
`注意：`ViewController 必须实现`Navigatorible`协议
```swift
// sourcery: router: desc="第一个viewController"
// sourcery: router: name="home_page"
// sourcery: router: path="/home"
// sourcery: router: parameter="type:TestEnum:.a"
// sourcery: router: parameter="type1:TestEnum?:.b"
// sourcery: router: parameter="p3:String?:abc123"
// sourcery: router: parameter="p4:String?"
// sourcery: router: parameter="p5:Test2Enum?:.c"
// sourcery: router: parameter="p6:Test2Enum:.d"
// sourcery: router: parameter="p7:Int64"
// sourcery: router: parameter="blk:(()->Void)?"
class ViewController: UIViewController, Navigatorible {
    var navigator: NavigatorType!
    var parameter: Router.PRHome_page?
    required init(navigator: NavigatorType, parameterible: Parameterible?) {
        super.init(nibName: nil, bundle: nil)
        self.parameter = parameterible as? Router.PRHome_page
    }

    // ...
}

/// output
/*
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
*/
```
- Push
```swift
let para = Router.PRHome_page(type: .a, p6: .c, p7: 100)
self.navigator.push(Router.home_page, context: para)

// or
self.navigator.push("\(Router.home_page)?type=a&type1=b&p7=1")
```

## Author

goo.gle@foxmail.com

## License

URLNavigatorExt is available under the MIT license. See the LICENSE file for more info.
