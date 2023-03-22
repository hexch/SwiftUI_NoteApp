//
//  View+.swift
//  NotesApp
//
//  Created by XIAOCHUAN HE on R 5/03/22.
//

import Foundation
import SwiftUI

extension View{
    var isMacOS: Bool{
        #if os(iOS)
        return false
        #else
        return true
        #endif
    }
    var realRect: CGRect{
        #if os(iOS)
        return UIScreen.main.bounds
        #else
        return NSScreen.main!.visibleFrame
        #endif
    }
    
}
