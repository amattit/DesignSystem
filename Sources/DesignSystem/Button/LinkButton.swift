//
//  File.swift
//  
//
//  Created by MikhailSeregin on 10.03.2022.
//

import SwiftUI
import Foundation
import UIKit

public struct LinkButton: View {
    private var title: String
    private var url: URL
    
    public init(url: String) {
        if let url = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""), let components = URLComponents(url: url, resolvingAgainstBaseURL: true) {
            self.url = url
            self.title = components.host ?? url.absoluteString
        } else {
            self.title = "www.wikipedia.org"
            self.url = URL(string: "www.wikipedia.org")!
        }
    }
    
    public var body: some View {
        Button(action: {
            if UIApplication.shared.canOpenURL(self.url) {
                UIApplication.shared.open(self.url)
            }
        }) {
            Text(title)
                .brTypo(.p1)
        }
        .accentColor(.brPrimary)
        .padding(.top, 4)
    }
}

