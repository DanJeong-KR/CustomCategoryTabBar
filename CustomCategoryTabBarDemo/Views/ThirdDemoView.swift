//
//  ThirdDemoView.swift
//  CustomCategoryTabBar
//
//  Created by chang sic jung on 16/07/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class ThirdDemoView: UIView {
  lazy var thirdLabel: UILabel = {
    let lb = UILabel()
    lb.backgroundColor = .blue
    lb.font = UIFont.boldSystemFont(ofSize: 40)
    lb.text = "Third!"
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
    thirdLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
}


