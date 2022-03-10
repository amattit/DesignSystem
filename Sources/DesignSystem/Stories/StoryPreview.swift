//
//  StoryPreview.swift
//  HappyBrain
//
//  Created by Михаил Серегин on 19.04.2021.
//  Copyright © 2021 Mikhail Seregin. All rights reserved.
//

import SwiftUI
import Kingfisher

public struct StoryPreview: View {
    var story: Story
    
    public init(story: Story) {
        self.story = story
    }
    
    public var body: some View {
        ZStack {
            VStack {
                Spacer()
                story.image.map {
                    KFImage(URL(string: $0))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .blur(radius: 5)
                }
            }
            Text(story.title)
                .bold()
                .padding(.horizontal, 8)
        }
        .brTypo(.p1)
        .foregroundColor(.white)
        .frame(width: 100, height: 100)
        .smoothingCornerRadius(20)
    }
}

struct StoryPreview_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack {
                StoryPreview(
                    story: .init(
                        id: "11",
                        title: "How to increase or decrease serotonin?",
                        image: "https://i.pinimg.com/originals/77/b0/93/77b093aff0f0147835cbedec1533002b.png",
                        colorCode: "accentGreenLight",
                        slides: [
                            Story.Slide(id: "1", header: "Header", text: "To increase serotonin you need", image: "https://i.pinimg.com/originals/77/b0/93/77b093aff0f0147835cbedec1533002b.png", backgroundColor: ""),
                            Story.Slide(id: "2", header: "Header", text: "at first", image: "https://bipbap.ru/wp-content/uploads/2017/06/81833890_f4a1681c70.jpg", backgroundColor: ""),
                            Story.Slide(id: "3", header: "Header", text: "at second", image: "https://static6.depositphotos.com/1006597/606/i/600/depositphotos_6065712-stock-photo-peter-and-paul-fortress-in.jpg", backgroundColor: ""),
                            Story.Slide(id: "4", header: "Header", text: "at third", image: "https://static6.depositphotos.com/1006597/606/i/600/depositphotos_6065712-stock-photo-peter-and-paul-fortress-in.jpg", backgroundColor: "")
                        ]
                    )
                )
                StoryPreview(
                    story: .init(
                        id: "1",
                        title: "How to increase or decrease serotonin?",
                        image: "https://static6.depositphotos.com/1006597/606/i/600/depositphotos_6065712-stock-photo-peter-and-paul-fortress-in.jpg",
                        colorCode: "accentYellowLight",
                        slides: [
                            Story.Slide(id: "1", header: "Header", text: "To increase serotonin you need", image: "maskot", backgroundColor: ""),
                            Story.Slide(id: "2", header: "Header", text: "at first", image: "maskot", backgroundColor: ""),
                            Story.Slide(id: "3", header: "Header", text: "at second", image: "maskot", backgroundColor: ""),
                            Story.Slide(id: "4", header: "Header", text: "at third", image: "maskot", backgroundColor: "")
                        ]
                    )
                )
            }
            .padding(.horizontal)
        }
    }
}

public struct Story: Identifiable {
    public var id: String
    
    public var title: String
    
    public var image: String?
    
    public var colorCode: String
    
    public var slides: [Slide]; public struct Slide: Identifiable {
        public let id: String
        public let header: String
        public let text: String
        public let image: String?
        public let backgroundColor: String?
        
        public init(
            id: String,
            header: String,
            text: String,
            image: String? = nil,
            backgroundColor: String? = nil
        ) {
            self.id = id
            self.header = header
            self.text = text
            self.image = image
            self.backgroundColor = backgroundColor
        }
    }
    
    public init(
        id: String,
        title: String,
        image: String? = nil,
        colorCode: String,
        slides: [Slide]
        ) {
        self.id = id
        self.title = title
        self.image = image
        self.colorCode = colorCode
        self.slides = slides
    }
}
