//
//  ThirdDemoView.swift
//  CustomCategoryTabBar
//
//  Created by chang sic jung on 16/07/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class ThirdDemoView: UIView {
  lazy var secondLabel: UILabel = {
    let lb = UILabel()
    lb.backgroundColor = .blue
    lb.font = UIFont.boldSystemFont(ofSize: 40)
    lb.text = "세 번째"
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


