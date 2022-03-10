//
//  SliderContainer.swift
//  HappyBrain
//
//  Created by MikhailSeregin on 20.04.2021.
//  Copyright © 2021 Mikhail Seregin. All rights reserved.
//

import SwiftUI

public struct SliderContainerView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var storyTimer: StoryTimer
    
    public init(slides: [Story.Slide]) {
        self.slides = slides
        storyTimer = StoryTimer(items: slides.count, interval: 8.0)
    }
    
    let slides: [Story.Slide]
    public var body: some View {
        content
    }
    
    private var content: some View {
        GeometryReader { geometry in
                ZStack(alignment: .bottom) {
                    SlideView(slide: slides[Int(storyTimer.progress)], proxy: geometry)
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width, height: nil, alignment: .center)
                        .animation(.none)
                        
                    HStack(alignment: .center, spacing: 4) {
                        ForEach(self.slides.indices) { x in
                            LoadingRectangle(progress: min( max( (CGFloat(self.storyTimer.progress) - CGFloat(x)), 0.0) , 1.0) )
                                .frame(height: 2, alignment: .leading)
                                .animation(.linear)
                        }
                    }
                    .padding()
                    HStack(alignment: .center, spacing: 0) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                self.storyTimer.advance(by: -1)
                        }
                        Rectangle()
                            .foregroundColor(.clear)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                self.storyTimer.advance(by: 1)
                        }
                    }
                }
                .onAppear { self.storyTimer.start() }
                .onDisappear { self.storyTimer.stop() }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct SliderContainer_Previews: PreviewProvider {
    
    static var text: String = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    
    - Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
    
    - Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.
    
    - Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.
    """
    static var previews: some View {
        SliderContainerView(slides: [
            Story.Slide(id: "1", header: "Первый слайд", text: text, image: "https://i.pinimg.com/originals/77/b0/93/77b093aff0f0147835cbedec1533002b.png", backgroundColor: "accentYellowLight"),
            Story.Slide(id: "2", header: "Второй слайд", text: "Отсюда вы поймете что-то, а может быть и не поймете ничего", image: "https://bipbap.ru/wp-content/uploads/2017/06/81833890_f4a1681c70.jpg", backgroundColor: "accentYellowLight"),
            Story.Slide(id: "3", header: "Третий слайд", text: "Отсюда вы поймете что-то, а может быть и не поймете ничего", image: "https://static6.depositphotos.com/1006597/606/i/600/depositphotos_6065712-stock-photo-peter-and-paul-fortress-in.jpg", backgroundColor: "accentYellowLight"),
            Story.Slide(id: "4", header: "Четвертый слайд", text: "Отсюда вы поймете что-то, а может быть и не поймете ничего", image: "https://bipbap.ru/wp-content/uploads/2017/06/4-5.jpg", backgroundColor: "accentYellowLight")
        ])
    }
}
