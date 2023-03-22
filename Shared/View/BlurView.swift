//
//  BlurView.swift
//  NotesApp
//
//  Created by XIAOCHUAN HE on R 5/03/22.
//

import SwiftUI
#if os(iOS)
import UIKit
struct BlurView: UIViewRepresentable {
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
    var style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
}
#endif
