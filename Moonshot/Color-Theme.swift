//
//  Color-Theme.swift
//  Moonshot
//
//  Created by Derek Velzy on 11/16/21.
//

import Foundation
import SwiftUI

// ShapeStyle type contains the Color type
// Very specific extension that allow us to use these colors everywhere SwiftUI expects a ShapeStyle to be given
extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
