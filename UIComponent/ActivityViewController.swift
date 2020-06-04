//
//  ActivityViewController.swift
//  UIComponent
//
//  Created by stnamco on 2020/06/04.
//  Copyright © 2020 namco. All rights reserved.
//

import SwiftUI

public struct ActivityViewController: UIViewControllerRepresentable {

    public func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    public func makeUIViewController(context: Context) -> UIActivityViewController {
        let items = ["Hello, World"]
        let controller = UIActivityViewController(activityItems: items, applicationActivities: [])
        controller.excludedActivityTypes = [.copyToPasteboard]
        return controller
    }

    public func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {

    }

    public class Coordinator: NSObject, UIActivityItemSource {
        var parent: ActivityViewController
        let text = "This is my cat"

        init(parent: ActivityViewController) {
            self.parent = parent
        }

        public func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
            return text
        }

        public func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
            guard let type = activityType else {
                return nil
            }

            switch type {
            case .saveToCameraRoll, .airDrop:
                return nil
            default:
                return text
            }
        }
    }

    public init() {}
}

struct ActivityViewController_Previews: PreviewProvider {
    static var previews: some View {
        ActivityViewController()
    }
}
