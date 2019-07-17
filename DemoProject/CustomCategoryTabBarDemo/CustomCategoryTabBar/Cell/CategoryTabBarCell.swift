//
//  CategoryTabBarCell.swift
//  HouseOfToday
//
//  Created by chang sic jung on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CategoryTabBarCell: UICollectionViewCell {

  lazy var label: UILabel = {
    let lb = UILabel()
    lb.text = "Text"
    lb.font = UIFont.boldSystemFont(ofSize: 18)
    lb.textColor = .black

    addSubview(lb)
    return lb
  }()

  override var isSelected: Bool {
    didSet {
      label.textColor = self.isSelected ?  #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) : .black
    }
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    label.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }

}
