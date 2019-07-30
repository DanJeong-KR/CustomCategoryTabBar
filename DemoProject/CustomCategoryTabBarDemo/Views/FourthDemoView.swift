//
//  FourthDemoView.swift
//  CustomCategoryTabBarDemo
//
//  Created by Sicc on 30/07/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class FourthDemoView: UIView {

  lazy var fourthLabel: UILabel = {
    let lb = UILabel()
    lb.backgroundColor = .green
    lb.font = UIFont.boldSystemFont(ofSize: 40)
    lb.text = "Fourth!"
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
    fourthLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }

}
