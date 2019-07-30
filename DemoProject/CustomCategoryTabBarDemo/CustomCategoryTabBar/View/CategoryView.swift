//
//  CategoryView.swift
//  HouseOfToday
//
//  Created by chang sic jung on 11/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CategoryView: UIView {

  internal var categoryViews: [UIView] = []

  lazy var pageCollectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal

    let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    cv.isPagingEnabled = true
    cv.showsHorizontalScrollIndicator = false
    cv.backgroundColor = .white
    cv.allowsSelection = false
    addSubview(cv)
    cv.register(cell: CategoryCell.self)
    cv.dataSource = self.self
    cv.delegate = self.self
    return cv
  }()

  internal var categoryViewDidEndScroll: ((Int) -> Void)?

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    makeConstraints()
  }

  private func makeConstraints() {
    pageCollectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

}

extension CategoryView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  // MARK: - UICollectionViewDataSource
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryViews.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeue(CategoryCell.self, indexPath)
    cell.categoryView = categoryViews[indexPath.row]

    return cell
  }

  // MARK: - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    // 셀 사이즈 잡고 -> 셀 안에있는 뷰의 오토레이아웃 대로 잡히고
    return CGSize(width: self.bounds.width, height: self.bounds.height)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }

  // MARK: - Delegate
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
    let itemAt = Int(targetContentOffset.pointee.x / UIScreen.main.bounds.width)

    guard let pageDidScroll = categoryViewDidEndScroll else { return logger() }
    pageDidScroll(itemAt)

  }
}
