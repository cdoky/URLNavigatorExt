//
//  ViewController.swift
//  URLNavigatorExt
//
//  Created by goo.gle@foxmail.com on 11/26/2019.
//  Copyright (c) 2019 goo.gle@foxmail.com. All rights reserved.
//

import UIKit
import URLNavigatorExt
import URLNavigator


enum TestEnum: String {
    case a = "a"
    case b = "b"
}

enum Test2Enum: Int {
    case c = 100
    case d
}

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

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

