//
//  File.swift
//  
//
//  Created by MikhailSeregin on 28.01.2022.
//

import SwiftUI

public struct Card: View {
    public init(image: Image? = nil, title: String, subtitle: String = "", text: String, caption: String = "") {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.caption = caption
    }
    
    var image: Image?
    var title: String
    var subtitle: String
    var text: String
    var caption: String
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            image?
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                .brTypo(.h6)
                .padding(.horizontal)
                .padding(.top, 14)
                .padding(.bottom, 6)
            if !subtitle.isEmpty {
                Text(subtitle)
                    .brTypo(.s2)
                    .padding(.horizontal)
            }
            Divider()
                .padding(.vertical, 16)
            Text(text)
                .brTypo(.p1)
                .opacity(0.8)
                .padding(.horizontal)
            if !caption.isEmpty {
                Divider()
                    .padding(.vertical, 16)
                Text(caption)
                    .brTypo(.c2)
                    .padding(.horizontal)
            }
        }
    }
}

struct Cards_Previews: PreviewProvider {
    static let img = Image("bricks_banner")
    static let text = "A nebula is an interstellar cloud of dust, hydrogen, helium and other ionized gases. Originally, nebula was a name for any diffuse astronomical object, including galaxies beyond the Milky Way."
    
    static var previews: some View {
        Group {
            Card(image: img, title: "Title", subtitle: "Subtitle", text: text, caption: "Caption")
            Card(image: img, title: "Title", subtitle: "Subtitle", text: text)
            Card(title: "Title", subtitle: "Subtitle", text: text)
            Card(title: "Title", text: text)
        }
        .previewLayout(.fixed(width: 300, height: 430))
    }
}
