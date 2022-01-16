//
//  BlurView.swift
//  FancyScrollView
//
//  Created by Mathias Quintero on 12/25/19.
//

import SwiftUI

public struct BlurView: UIViewRepresentable {
    public func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        var frame = backgroundImage.frame
        frame.size.height = 252
        backgroundImage.frame = frame
        backgroundImage.image = UIImage(named: "headerbg")!
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        return view
    }

    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
        guard let effectView = uiView.subviews.first as? UIVisualEffectView else { return }
        let blurEffect = UIBlurEffect(style: context.environment.colorScheme == .dark ? .dark : .light)
        effectView.effect = blurEffect

    }
}
