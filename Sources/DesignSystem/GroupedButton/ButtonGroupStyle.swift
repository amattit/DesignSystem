//
//  File.swift
//  
//
//  Created by MikhailSeregin on 28.01.2022.
//

import SwiftUI

public struct ButtonGroupStyle: ButtonStyle {
    public init(sizesStyle: ButtonGroupStyle.SizeStyle, colorStyle: ButtonGroupStyle.Style, icon: Image? = nil, text: String = "") {
        self.sizesStyle = sizesStyle
        self.colorStyle = colorStyle
        self.icon = icon
        self.text = text
    }
    
    
    var sizesStyle: SizeStyle
    var colorStyle: Style
    var icon: Image? = nil
    var text: String = ""
    
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            
            .font(.system(size: sizesStyle.fontSize, weight: .bold))
            .frame(width: sizesStyle.frameWidth, height: sizesStyle.frameWidth)
            .foregroundColor(configuration.isPressed ? colorStyle.activeForeground : colorStyle.defaultForeground)
            .background(configuration.isPressed ? colorStyle.activeBackground : colorStyle.defaultBackground)
            .border(colorStyle.defaultForeground, width: (colorStyle == .outline && !configuration.isPressed) ? 1 : 0)
    }
}

struct ButtonGroupStyle_Previews: PreviewProvider {
    typealias brSize = ButtonGroupStyle.SizeStyle
    
    static var previews: some View {
        
        VStack(spacing : 20) {
            
            HStack(spacing: 20) {
                
                Button(action : {  }, label: {Text("G")})
                    .buttonStyle(ButtonGroupStyle(sizesStyle: .giant, colorStyle: .primary ))
                
                Button(action : {}, label: {Text("L")})
                    .buttonStyle(ButtonGroupStyle(sizesStyle: .large, colorStyle: .basic ))
            }
        
            HStack(spacing: 20) {
                Button(action : {}, label: {Text("M")})
                    .buttonStyle(ButtonGroupStyle(sizesStyle: .medium, colorStyle: .outline ))
                
                Button(action : {}, label: {Text("S")})
                    .buttonStyle(ButtonGroupStyle(sizesStyle: .small, colorStyle: .basic ))
            }
            
            HStack(spacing: 20) {
                
                Button(action : {}, label: {Text("T")})
                    .buttonStyle(ButtonGroupStyle(sizesStyle: .tiny, colorStyle: .primary ))
            }
            
            HStack(spacing: 20) {
                
                Button(action : {}, label: {Image(systemName: "star.fill").brSquare(width: brSize.large.iconScale)})
                    .buttonStyle(ButtonGroupStyle(sizesStyle: .medium, colorStyle: .basic))
                
                Button(action : {}, label: {Image(systemName: "person").brSquare(width: brSize.large.iconScale)})
                    .buttonStyle(ButtonGroupStyle(sizesStyle: .medium, colorStyle: .outline))
                
                Button(action : {}, label: {Image(systemName: "umbrella").brSquare(width: brSize.large.iconScale)})
                    .buttonStyle(ButtonGroupStyle(sizesStyle: .medium, colorStyle: .primary))
            }
        }
    }
}

