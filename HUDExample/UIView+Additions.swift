//
//  UIView+Additions.swift
//  HUDExample
//
//  Created by Ranjith Kumar on 6/23/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

extension UIView: HUDShowing {

    @discardableResult
    func showHUD(title: String?,
                 animated: Bool = true) -> HUD {
        return self.showHUD(in: self,
                            title: title,
                            animated: animated)
    }

    func hideHUD(animated: Bool = true) {
        guard let hud = HUD.hud(in: self) else { return }

        self.hideHUD(hud, animated: animated)
    }
}

