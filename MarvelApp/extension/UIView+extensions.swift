//
//  UIView+extensions.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import UIKit

extension UIView {
    
    var allSubviews: [UIView] {
        return subviews.flatMap { [$0] + $0.allSubviews }
    }
    
    func findSubViews(_ T: AnyClass) -> [UIView] {
        
        var array = [UIView]()
        for vw in self.subviews {
            if vw.isKind(of: T) {
                array.append(vw)
            } else {
                array += vw.findSubViews(T)
            }
        }
        return array
    }
    var outermostOrigin: CGPoint {
        return self.superview!.convert(self.frame.origin, to:nil)
    }
}
