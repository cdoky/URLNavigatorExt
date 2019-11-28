//
//  ViewController02.swift
//  URLNavigatorExt_Example
//
//  Created by phil on 2019/11/26.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import URLNavigatorExt
import URLNavigator

// sourcery: router: desc="ViewController02"
// sourcery: router: name="page02"
// sourcery: router: path="/page02"
// sourcery: router: parameter="uid:Int64:0"
// sourcery: router: parameter="name:String:这是一个测试参数"
class ViewController02: UIViewController, Navigatorible {
    var navigator: NavigatorType!

    required init(navigator: NavigatorType, parameterible: Parameterible?) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
