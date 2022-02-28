//
//  CollectionView.swift
//  HappyBrain
//
//  Created by Михаил Серегин on 20.12.2020.
//  Copyright © 2020 Mikhail Seregin. All rights reserved.
//

import SwiftUI

struct MyPreferenceKeyData: Equatable {
    var size: CGSize
    var id: AnyHashable
}

struct MyPreferenceKey: PreferenceKey {
    typealias Value = [MyPreferenceKeyData]
    
    static var defaultValue: [MyPreferenceKeyData] = []
    
    static func reduce(value: inout [MyPreferenceKeyData], nextValue: () -> [MyPreferenceKeyData]) {
        value.append(contentsOf: nextValue())
    }
}


let empty = AnyView(Color.clear.frame(height: 0).fixedSize())

struct PropagatesSize<ID: Hashable, V: View>: View {
    var id: ID
    var content: V
    var body: some View {
        content.background(GeometryReader { proxy in
            empty.preference(key: MyPreferenceKey.self, value: [MyPreferenceKeyData(size: proxy.size, id: AnyHashable(self.id))])
        })
    }
}

struct FlowLayout {
    let spacing: UIOffset
    let containerSize: CGSize
    
    init(containerSize: CGSize, spacing: UIOffset = UIOffset(horizontal: 10, vertical: 10)) {
        self.spacing = spacing
        self.containerSize = containerSize
    }
    
    var currentX = 0 as CGFloat
    var currentY = 0 as CGFloat
    var lineHeight = 0 as CGFloat
    
    mutating func add(element size: CGSize) -> CGRect {
        if currentX + size.width > containerSize.width {
            currentX = 0
            currentY += lineHeight + spacing.vertical
            lineHeight = 0
        }
        defer {
            lineHeight = max(lineHeight, size.height)
            currentX += size.width + spacing.horizontal
        }
        return CGRect(origin: CGPoint(x: currentX, y: currentY), size: size)
    }
    
    var size: CGSize {
        return CGSize(width: containerSize.width, height: currentY + lineHeight)
    }
}

public struct CollectionView<Data, Content>: View where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {
    @State
    private var heght: CGFloat = .zero
    
    @State
    private var sizes: [MyPreferenceKeyData] = []
    
    var data: Data
    var content: (Data.Element) -> Content
    
    public init(
        data: Data,
        content: @escaping (Data.Element) -> Content
        ) {
        self.data = data
        self.content = content
    }
    
    func layout(size: CGSize) -> (items: [AnyHashable:CGSize], size: CGSize) {
        var f = FlowLayout(containerSize: size)
        var result: [AnyHashable:CGSize] = [:]
        for s in sizes {
            let rect = f.add(element: s.size)
            result[s.id] = CGSize(width: rect.origin.x, height: rect.origin.y)
        }
        DispatchQueue.main.async {
            self.heght = f.size.height
        }
        return (result, f.size)
    }
    
    func withLayout(_ laidout: (items: [AnyHashable:CGSize], size: CGSize)) -> some View {
        ZStack(alignment: .topLeading) {
            ForEach(self.data) { el in
                PropagatesSize(id: el.id, content: self.content(el))
                    .offset(laidout.items[AnyHashable(el.id)] ?? .zero)
            }
            Color.clear.frame(width: laidout.size.width, height: laidout.size.height).fixedSize()
        }
        .background(Color.clear)
        .onPreferenceChange(MyPreferenceKey.self, perform: { size in
            self.sizes = size
        })
    }
    
    public var body: some View {
        return GeometryReader { proxy in
            self.withLayout(self.layout(size: proxy.size))
        }
        .frame(height: heght)
    }
}
