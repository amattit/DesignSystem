//
//  File.swift
//  
//
//  Created by MikhailSeregin on 28.01.2022.
//

import SwiftUI
import XCTest

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
            image.map { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
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

public struct CustomCard<Header: View, Content: View, Footer: View>: View {
    private let header: () -> Header?
    private let content: Content
    private let footer: () -> Footer?
    
    public init(
        header: @escaping () -> Header?,
        content: @escaping () -> Content,
        footer: @escaping () -> Footer?
    ) {
        self.header = header
        self.content = content()
        self.footer = footer
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack { Spacer() }
            headerView
            content
                .brTypo(.p1)
                .opacity(0.8)
                .padding(.horizontal)
                .padding(.vertical, 8)
            footerView
                .padding(.bottom)
        }
    }
    
    @ViewBuilder
    private var headerView: some View {
        header()
            .brTypo(.h6)
            .padding(.horizontal)
            .padding(.bottom, 6)
    }
    
    @ViewBuilder
    private var footerView: some View {
        footer()
            .brTypo(.c2)
            .padding(.horizontal)
    }
}

public extension CustomCard where Header == EmptyView, Footer == EmptyView {
    init(content: @escaping () -> Content) {
        self.header = { EmptyView() }
        self.content = content()
        self.footer = { EmptyView() }
    }
}

public extension CustomCard where Header == EmptyView {
    init(content: @escaping () -> Content, footer: @escaping () -> Footer?) {
        self.header = { EmptyView() }
        self.content = content()
        self.footer = footer
    }
}

public extension CustomCard where Footer == EmptyView {
    init(header: @escaping () -> Header?, content: @escaping () -> Content) {
        self.header = header
        self.content = content()
        self.footer = { EmptyView() }
    }
}


struct Cards_Previews: PreviewProvider {
    static let img = Image("bricks_banner")
    static let text = "A nebula is an interstellar cloud of dust, hydrogen, helium and other ionized gases. Originally, nebula was a name for any diffuse astronomical object, including galaxies beyond the Milky Way."
    
    static var previews: some View {
        Group {
            CustomCard(header: { Text("Header") }, content: { Text("some text") }, footer: { Text("Footer") })
            CustomCard(content: {
                VStack(alignment: .leading) {
                    Text("Content")
                    Text("Content 2")
                    Circle()
                        .frame(width: 5, height: 5)
                }
            })
            Card(image: nil, title: "Title", subtitle: "Subtitle", text: text, caption: "Caption")
            Card(image: img, title: "Title", subtitle: "Subtitle", text: text)
            Card(title: "Title", subtitle: "Subtitle", text: text)
            Card(title: "Title", text: text)
        }
        .previewLayout(.sizeThatFits)
    }
}
