//
//  CategoryTabBarViewController.swift
//  HouseOfToday
//
//  Created by chang sic jung on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CategoryTabBarViewController: UIViewController {

  // MARK: - CategoryTabBarViewController 를 초기화할때 설정 값들 (초기화 한 후로는 변경하지 못하게 private )
  /// 카테고리를 설정할 때 얘를 설정한다.
  private var categoryTitles: [String]!

  /// 카테고리가 일정 수 넘어가면 true 로 설정해서 카테고리를 움직일 수 있게 한다.
  private var categoryTabBarScrollIsEnabled: Bool!

  private var categoryViews: [UIView]!

  init(withTitles categoryTitles: [String], withViews categoryViews: [UIView], withScrollOption tabBarScrollIsEnabled: Bool = true ) {
    super.init(nibName: nil, bundle: nil)
    self.categoryTitles = categoryTitles
    self.categoryViews = categoryViews
    self.categoryTabBarScrollIsEnabled = tabBarScrollIsEnabled
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  // MARK: - 변수선언
  private lazy var categoryTabBarView: CategoryTabBarView = {
    let ctv = CategoryTabBarView()
    ctv.isScrollEnabled = self.categoryTabBarScrollIsEnabled
    ctv.categoryTitles = categoryTitles
    view.addSubview(ctv)
    return ctv
  }()

  private lazy var indicatorBarView: IndicatorBarView = {
    let v = IndicatorBarView()
    view.addSubview(v)
    v.categoryTitles = categoryTitles
    return v
  }()

  private lazy var categoryView: CategoryView = {
    let cv = CategoryView()
    cv.categoryViews = self.categoryViews
    view.addSubview(cv)
    return cv
  }()

  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    didSelectCategoryTabBarCell()
    categoryDidScroll()
    makeConstraints()
    categoryViewDidEndScroll()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

  }

  // MARK: - CallBack 함수들

  private func didSelectCategoryTabBarCell() {
    // 콜백으로 시점문제 해결
    self.categoryTabBarView.didSelectCategoryCell = {
      [weak self] index in
      guard let self = self else { return logger("weak reference error") }
      // 내가 필요한 값 전달
      self.indicatorBarView.didSelectCategoryCell = index

      // 스크롤을 위해 index 공유하기
      self.didSelectedCategoryCell = index

       // Controller 부분에서 애니메이션 적용.
      UIView.animate(withDuration: 0.5,
                     delay: 0,
                     usingSpringWithDamping: 0.7,
                     initialSpringVelocity: 1,
                     options: .curveEaseInOut,
                     animations: {
                      self.view.layoutIfNeeded()
      },
                     completion: nil)

      let xOffset = CGFloat(index.item) * UIScreen.main.bounds.width
      self.categoryView.pageCollectionView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
    }
  }

  // scroll 에서 didSelectedCategoryCell 정보 필요해서 변수로 만들었다.
  private var didSelectedCategoryCell: IndexPath?
  private func categoryDidScroll() {
    self.categoryTabBarView.categoryDidScroll = {
      [weak self] scrollView in
      guard let self = self else { return logger("weak reference error") }
      let widthSize = UIScreen.main.bounds.width / CGFloat(self.categoryTitles.count)
      let leftOffset = scrollView.contentOffset.x

            self.indicatorBarView.snp.updateConstraints {
        $0.leading.equalTo(widthSize * CGFloat(self.didSelectedCategoryCell?.row ?? 0) - leftOffset)
      }
    }
  }

  private func categoryViewDidEndScroll() {
    categoryView.categoryViewDidEndScroll = {
      [weak self] itemAt in
      guard let self = self else { return logger("weak reference error") }
      self.categoryTabBarView.categoryTabBarCollectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
      self.categoryTabBarView.collectionView(self.categoryTabBarView.categoryTabBarCollectionView, didSelectItemAt: IndexPath(item: itemAt, section: 0))
    }
  }

  private func makeConstraints() {
    categoryTabBarView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(view.snp.height).multipliedBy(0.045)
    }

    indicatorBarView.snp.makeConstraints {
      $0.top.equalTo(categoryTabBarView.snp.bottom)
      $0.leading.equalToSuperview()
      //$0.width.equalTo(40)
      $0.height.equalTo(categoryTabBarView.snp.height).multipliedBy(0.1)
    }

    categoryView.snp.makeConstraints {
      $0.top.equalTo(indicatorBarView.snp.bottom)
      $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
    }
  }

}
