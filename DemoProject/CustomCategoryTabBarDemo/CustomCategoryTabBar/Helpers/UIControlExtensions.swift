//
//  UIButtonExtensions.swift
//  WeatherForecast
//
//  Created by giftbot on 14/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

// button.addTarget(self, action: #selector(abs(_:)), for: .touchUpInside) 귀찮아서
// button.addTarget(action: #selector(abs(_:))) 로 사용할 것
extension UIControl {
  func addTarget(action: Selector) {
    guard let vc = parentViewController else {
      fatalError("addSubview 메서드 호출 이후에 사용해야 함")
    }
    addTarget(vc, action: action, for: .touchUpInside)
  }
    // MARK: - 자기가 속해있는 View Controller 를 알 수 있다.
    var parentViewController: UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            responder = nextResponder
            // 건너건너 vc 최 상위의 뷰 다음에 View Controller 가 나오면
            if let vc = nextResponder as? UIViewController {
                return vc
            }
        }
        return nil
    }
}
