//
//  CategoryCell.swift
//  HouseOfToday
//
//  Created by chang sic jung on 12/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {

  var categoryView: UIView? {
    didSet {
      guard let v = self.categoryView else { return logger("testView is nil")}
      addSubview(v)
      v.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

}
