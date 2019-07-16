//
//  CategoryBarView.swift
//  HouseOfToday
//
//  Created by chang sic jung on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CategoryTabBarView: UIView {

  var categoryTitles: [String] = []

  /// 스크롤 가능한지 값 설정하기
  /// 마이페이지는 false 로 설정하고
  /// 홈은 true 로 설정해야 한다.
  var isScrollEnabled: Bool! {
    didSet {
      categoryTabBarCollectionView.isScrollEnabled = self.isScrollEnabled
    }
  }

  lazy var categoryTabBarCollectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal

    let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    cv.showsHorizontalScrollIndicator = false
    cv.backgroundColor = .white
    addSubview(cv)
    cv.dataSource = self.self
    cv.delegate = self.self
    cv.register(cell: CategoryTabBarCell.self)
    return cv
  }()

  // 인디케이터 바 나누기 시작하자

  // TODO: - 글자 크기에 따라서 IndicatorBar 따라오는거 구현 보류. 너무 어렵다.
  let fontSize = ("마" as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])

  var didSelectCategoryCell: ((IndexPath) -> Void)?

  var categoryDidScroll: ((UIScrollView) -> Void)?

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    makeConstraints()

  }

  private func makeConstraints() {
    categoryTabBarCollectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}

extension CategoryTabBarView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  // MARK: - UICollectionViewDataSource

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryTitles.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(CategoryTabBarCell.self, indexPath)
    cell.label.text = categoryTitles[indexPath.item]

    return cell
  }

  // MARK: - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)

    let widthSize = self.frame.width / CGFloat(categoryTitles.count)

    // CollectionView 의 Cell Size 결정할 때 indicatorBar 의 layout 도 같이 잡아준다.
    return CGSize(width: widthSize, height: self.frame.height)
  }

  // MARK: - UICollectionViewDelegate
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let callback = didSelectCategoryCell else { return logger() }
    callback(indexPath)
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    guard let callback = categoryDidScroll else { return logger() }
    callback(scrollView)
    //let leftOffset = scrollView.contentOffset.x

    // 컬렉션 뷰 움직이면 indicatorBar 도 같이 움직이게
  }

}
