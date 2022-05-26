//
//  UserCell.swift
//  URLNavigatorExample
//
//  Created by Suyeol Jeon on 7/13/16.
//  Copyright © 2016 Suyeol Jeon. All rights reserved.
//

import UIKit

final class UserCell: UITableViewCell {

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

