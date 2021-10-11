//
//  UINavigationBar+extensions.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import Foundation
import UIKit

extension UINavigationBar {
    
    func setTitleAttributes(){
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red,
                                                                  NSAttributedString.Key.font: UIFont(name: "Avengero", size: 14)!]
        
        self.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red,
                                                                  NSAttributedString.Key.font: UIFont(name: "Avengero", size: 16)!]
    }
}
