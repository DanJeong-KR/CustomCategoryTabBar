//
//  CategoryIndicatorBar.swift
//  HouseOfToday
//
//  Created by chang sic jung on 14/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class IndicatorBarView: UIView {

  internal var categoryTitles: [String]! // 초기화부터 넣어주니까 무조건 들어가겠지

  /// 동적으로 오토레이아웃 잡기 실패

  internal var didSelectCategoryCell: IndexPath! {
    didSet {
      let widthSize = UIScreen.main.bounds.width / CGFloat(categoryTitles.count)
      self.snp.updateConstraints {
        $0.leading.equalTo(widthSize * CGFloat(self.didSelectCategoryCell.row))
      }
    }
  }

  internal var categoryDidScroll: UIScrollView! {
    didSet {
      let widthSize = UIScreen.main.bounds.width / CGFloat(categoryTitles.count)
      let leftOffset = self.categoryDidScroll.contentOffset.x
      self.snp.updateConstraints {
        $0.leading.equalTo(widthSize * CGFloat(self.didSelectCategoryCell.row) + leftOffset)
      }
    }
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    makeConstraints()

  }

  private func makeConstraints() {
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }
  override var intrinsicContentSize: CGSize {
    return self.frame.size
  }

  override func updateConstraints() {
    super.updateConstraints()
    let widthSize = UIScreen.main.bounds.width / CGFloat(categoryTitles.count)
    self.snp.makeConstraints {
      $0.width.equalTo(widthSize)
    }
  }
}
