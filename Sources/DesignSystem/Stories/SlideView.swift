//
//  SlideView.swift
//  HappyBrain
//
//  Created by MikhailSeregin on 20.04.2021.
//  Copyright © 2021 Mikhail Seregin. All rights reserved.
//

import SwiftUI
import Kingfisher

struct SlideView: View {
    let slide: Story.Slide
    let proxy: GeometryProxy
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer()
                slide.image.map {
                    KFImage(URL(string: $0))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: proxy.size.height)
                        .blur(radius: 5)
//                    Image($0, bundle: .module)
                }
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                }
                Text(slide.header)
                    .brTypo(.h2)
                Text(slide.text)
                    .brTypo(.s1)
            }
            .padding()
//            .isHidden(slide.url != nil)
        }
//        .background(
//            Color(.red).opacity(0.2)
//        )
        
    }
}

//struct SlideView_Previews: PreviewProvider {
//    static var previews: some View {
//        SlideView(slide: Story.Slide(id: "1", header: "Как улучшить серотонин?", text: "Отсюда вы поймете что-то, а может быть и не поймете ничего", image: "https://i.pinimg.com/originals/77/b0/93/77b093aff0f0147835cbedec1533002b.png", backgroundColor: "accentYellowLight", url: nil))
//    }
//}

extension View {
    
    @ViewBuilder
    func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
