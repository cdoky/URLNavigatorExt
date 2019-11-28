//
//  ViewController01.swift
//  URLNavigatorExt_Example
//
//  Created by phil on 2019/11/26.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import URLNavigatorExt
import URLNavigator

// sourcery: router: desc="ViewController01"
// sourcery: router: name="page01"
// sourcery: router: path="/page01"
class ViewController01: UIViewController, Navigatorible {
    var navigator: NavigatorType!

    required init(navigator: NavigatorType, parameterible: Parameterible?) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
