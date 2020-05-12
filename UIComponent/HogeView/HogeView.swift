//
//  HogeView.swift
//  UIComponent
//
//  Created by stnamco on 2020/05/12.
//  Copyright © 2020 namco. All rights reserved.
//

import SwiftUI

public struct HogeView: View {

    public var body: some View {

      ZStack {
        Color.blue
          .edgesIgnoringSafeArea(.all)

        Text("Hello, World")
            .foregroundColor(Color.white)
      }
    }

    public init() {}
}

struct HogeView_Previews: PreviewProvider {
    static var previews: some View {
        HogeView()
    }
}
