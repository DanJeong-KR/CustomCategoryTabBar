//
//  CategoryView.swift
//  HouseOfToday
//
//  Created by chang sic jung on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class FirstDemoView: UIView {

  lazy var firstLabel: UILabel = {
    let lb = UILabel()
    lb.backgroundColor = .yellow
    lb.font = UIFont.boldSystemFont(ofSize: 40)
    lb.text = "첫 번째"
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
    firstLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
}
