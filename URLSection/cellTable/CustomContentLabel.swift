//
//  CustomContentLabel.swift
//  URLSection
//
//  Created by Huy on 7/21/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import Foundation
import UIKit

class CustomContentLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = ""
        self.numberOfLines = 0
        self.font = .systemFont(ofSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("loi xay ra neu rong")
    }
    
}
