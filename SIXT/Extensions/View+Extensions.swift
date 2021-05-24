//
//  View+Extensions.swift
//  SIXT
//
//  Created by Munachimso Ugorji on 24/05/2021.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


@IBDesignable
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.clipsToBounds = true
            setNeedsLayout()
        }
    }

    @IBInspectable var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
            setNeedsLayout()
        }

        get {
            return UIColor(cgColor: layer.borderColor!)
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
            setNeedsLayout()
        }

        get {
            return layer.borderWidth
        }
    }
}
