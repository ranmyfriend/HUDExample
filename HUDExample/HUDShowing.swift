//
//  HUDShowing.swift
//  HUDExample
//
//  Created by Ranjith Kumar on 6/23/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

protocol HUDShowing {
    func showHUD(in view: UIView,
                 title: String?,
                 animated: Bool) -> HUD
    func hideHUD(_ hud: HUD,
                 animated: Bool)
}

extension HUDShowing {

    func showHUD(in view: UIView,
                 title: String?,
                 animated: Bool = true) -> HUD {
        let hud = HUD(text: title)
        hud.frame = view.bounds
        view.addSubview(hud)
        hud.show(animated: animated)

        return hud
    }

    func hideHUD(_ hud: HUD,
                 animated: Bool = true) {
        hud.hide(animated: animated, completion: {
            hud.removeFromSuperview()
        })
    }
}

extension HUDShowing where Self: UIViewController, Self: HUDShowing {

    var viewToShowHUDIn: UIView {
        if let tabBar = self.tabBarController {
            return tabBar.view
        } else if let nav = self.navigationController {
            return nav.view
        } else {
            return self.view
        }
    }

    @discardableResult
    func showHUD(title: String?,
                 animated: Bool = true) -> HUD {
        return self.viewToShowHUDIn.showHUD(title: title, animated: animated)
    }

    func hideHUD(animated: Bool = true) {
        self.viewToShowHUDIn.hideHUD(animated: animated)
    }
}
