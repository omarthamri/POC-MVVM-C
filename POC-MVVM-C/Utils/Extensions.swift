//
//  Extensions.swift
//  POC-MVVM-C
//
//  Created by omar thamri on 22/11/2023.
//

import UIKit

extension UIView {
    
    func round( _ radius: CGFloat = 10) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor,width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
}

extension String {
    
    func convertDateToYear() -> String {
        if self.count > 4 {
        let index = self.index(self.startIndex, offsetBy: 4)
        return String(self[..<index])
        }
        return self
    }
    
}

