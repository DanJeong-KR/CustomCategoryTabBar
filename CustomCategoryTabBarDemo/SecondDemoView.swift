//
//  SecondCategoryView.swift
//  HouseOfToday
//
//  Created by chang sic jung on 11/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SecondDemoView: UIView {

  lazy var secondLabel: UILabel = {
    let lb = UILabel()
    lb.backgroundColor = .red
    lb.font = UIFont.boldSystemFont(ofSize: 40)
    lb.text = "두 번째"
    addSubview(lb)
    return lb
  }()

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    makeConstraints()
  }

  private func makeConstraints() {
    secondLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
}
