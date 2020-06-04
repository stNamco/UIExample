//
//  ChildView.swift
//  UIExample
//
//  Created by stnamco on 2020/06/04.
//  Copyright © 2020 namco. All rights reserved.
//

import SwiftUI

struct ChildView: View {
    @State var openSheet: Bool = false
    @State var openAlert: Bool = false
    @State var openActionSheet: Bool = false

    var body: some View {
        VStack(spacing: 40) {
            Button("Sheet", action: {
                self.openSheet.toggle()
            }).sheet(isPresented: $openSheet) {
                Text("Sheet")
            }
            Button("Alert", action: {
                self.openAlert.toggle()
            }).alert(isPresented: $openAlert) {
                Alert(title: Text("Alert"),
                      message: Text("Subtitle"),
                      primaryButton: Alert.Button.cancel(),
                      secondaryButton: Alert.Button.destructive(Text("Delete"))
                )
            }
            Button("ActionSheet", action: {
                self.openActionSheet.toggle()
            }).actionSheet(isPresented: $openActionSheet) { () -> ActionSheet in
                ActionSheet(title: Text("ActionSheet"), message: Text("Beef or Chicken"), buttons: [
                    .default(Text("Beef")),
                    .default(Text("Chicken")),
                    .cancel()
                ])
            }
        }
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView()
    }
}
