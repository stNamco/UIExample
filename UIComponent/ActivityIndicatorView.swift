//
//  ActivityIndicatorView.swift
//  UIComponent
//
//  Created by stnamco on 2020/06/04.
//  Copyright © 2020 namco. All rights reserved.
//

import SwiftUI

public struct ActivityIndicatorView: UIViewRepresentable {
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
        uiView.hidesWhenStopped = true
    }

    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicatorView = UIActivityIndicatorView(style: .large)
        return indicatorView
    }

    public init() {}
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
