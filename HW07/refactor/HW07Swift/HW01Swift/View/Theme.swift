//
//  Theme.swift
//  HW01Swift
//
//  Created by Kirill on 09/02/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//

import UIKit

protocol AppTheme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}



final class Theme {
    
    static var currentTheme: AppTheme = WhiteTheme()
}




final class WhiteTheme: AppTheme {
    var backgroundColor: UIColor = .white
    var textColor: UIColor = .gray
}

final class BlueTheme: AppTheme {
    var backgroundColor: UIColor = #colorLiteral(red: 0.5102659464, green: 1, blue: 0.980460465, alpha: 1)
    var textColor: UIColor = .black
}

final class GreenTheme: AppTheme {
    var backgroundColor: UIColor = #colorLiteral(red: 0, green: 1, blue: 0.4926850796, alpha: 1)
    var textColor: UIColor = .brown
}
