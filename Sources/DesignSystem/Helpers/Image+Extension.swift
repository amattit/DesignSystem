//
//  File.swift
//  
//
//  Created by MikhailSeregin on 28.01.2022.
//

import SwiftUI

extension Image {
    
    //MARK: Avatars
    
    ///Turn image into a circular avatar
    func brAvatarCircle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .padding(.all, 16)
        
    }
    
    ///Turn image into a rectangular avatar
    func brAvatarSquare() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40, height: 40)
            .clipShape(Rectangle())
            .padding(.all, 16)
        
    }
    ///Turn image into a rounded rectangle avatar
    func brAvatarRounded() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40, height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.all, 16)
        
    }
    
    //MARK: Styled Images
    
    ///Modify image to fit a circular format
    func brCircle(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
            .clipShape(Circle())
    }
    
    ///Modify image to fit a square format
    func brSquare(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
    }
    
    ///Modify image to fit a rounded corners square format
    func brRounded(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
            .clipShape(RoundedRectangle(cornerRadius: width/10.0))
    }
    ///Modify image to have upper rounded corners in a square format
    func brTopRounded(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
            .clipShape(RoundedCorner(radius: width/10.0, corners: [.topLeft, .topRight]))
    }
    
    ///Modify image to have lower rounded corners in a square format
    func brBottomRounded(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
            .clipShape(RoundedCorner(radius: width/10.0, corners: [.bottomLeft, .bottomRight]))
    }
    
    ///Modify image to have left-side rounded corners in a square format
    func brLeftRounded(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
            .clipShape(RoundedCorner(radius: width/10.0, corners: [.bottomLeft, .topLeft]))
        
            
    }
    
    ///Modify image to have right-side rounded corners in a square format
    func brRightRounded(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
            .clipShape(RoundedCorner(radius: width/10.0, corners: [.bottomRight, .topRight]))
    }
    
    
}


struct Images_Previews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                Image("bricks_logo")
                    .brAvatarCircle()
                Image("bricks_logo")
                    .brAvatarSquare()
                Image("bricks_logo")
                    .brAvatarRounded()
                
            }.padding()
            
            HStack(spacing: 20) {
                Image("bricks_logo")
                    .brCircle(width: 90)
                Image("bricks_logo")
                    .brSquare(width: 90)
                Image("bricks_logo")
                    .brRounded(width: 90)
            }.padding()
            
            HStack(spacing: 20) {
                Image("bricks_logo")
                    .brTopRounded(width: 120)
                Image("bricks_logo")
                    .brBottomRounded(width: 120)
            }.padding()
            
            HStack(spacing: 20) {
                Image("bricks_logo")
                    .brLeftRounded(width: 120)
                Image("bricks_logo")
                    .brRightRounded(width: 120)
            }.padding()
        }
    }
}
