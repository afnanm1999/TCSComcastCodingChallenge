//
//  UIViewController+Extensions.swift
//  SimpsonsCharacterViewer
//
//  Created by Afnan Mirza on 9/5/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showDefaultAlert(title: String, message: String, style: UIAlertController.Style = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okayAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
