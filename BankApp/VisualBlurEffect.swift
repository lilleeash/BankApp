//
//  VisualBlurEffect.swift
//  BankApp
//
//  Created by Darya Zhitova on 29.08.2022.
//

import SwiftUI

struct VisualBlurEffect: UIViewRepresentable {
    
    var uiVisualEffect: UIVisualEffect?
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = uiVisualEffect
    }
    
}
