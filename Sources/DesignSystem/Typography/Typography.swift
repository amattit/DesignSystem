//
//  File.swift
//  
//
//  Created by MikhailSeregin on 28.01.2022.
//

import SwiftUI

public struct BRTypography: ViewModifier {
    
    public enum Style {
        
        /// Titles
        case h1, h2, h3, h4, h5, h6
        
        /// Subtitles
        case s1, s2
        
        /// Paragraphs
        case p1, p2, p3
        
        /// Captions
        case c1, c2
    }
    
    public var style: Style
    
    public func body(content: Content) -> some View {
        switch style {
        case .h1: return content
            .font(.system(size: 36, weight: .bold))
        case .h2: return content
            .font(.system(size: 32, weight: .bold))
        case .h3: return content
            .font(.system(size: 30, weight: .bold))
        case .h4: return content
            .font(.system(size: 26, weight: .bold))
        case .h5: return content
            .font(.system(size: 22, weight: .bold))
        case .h6: return content
            .font(.system(size: 18, weight: .bold))
            
        case .s1: return content
            .font(.system(size: 15, weight: .semibold))
        case .s2: return content
            .font(.system(size: 13, weight: .semibold))
        
        case .p1: return content
            .font(.system(size: 18, weight: .regular))
        case .p2: return content
            .font(.system(size: 15, weight: .regular))
        case .p3: return content
            .font(.system(size: 13, weight: .regular))
            
        case .c1: return content
            .font(.system(size: 12, weight: .regular))
        case .c2: return content
            .font(.system(size: 12, weight: .bold))
        }
    }
}

public extension View {
    func brTypo(_ style: BRTypography.Style) -> some View {
        self
            .modifier(BRTypography(style: style))
    }
    
    func brTypo(_ style: BRTypography.Style, color: Color) -> some View {
        self
            .modifier(BRTypography(style: style))
            .foregroundColor(color)
    }
}


struct Typography_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            Group {
                Text("Typography h1").brTypo(.h1, color: .brPrimary)
                Text("Typography h1").brTypo(.h1, color: .brSuccess)
                Text("Typography h1").brTypo(.h1, color: .brDanger)
            
                Text("Typography h1").brTypo(.h1)
                Text("Typography h2").brTypo(.h2)
                Text("Typography h3").brTypo(.h3)
                Text("Typography h4").brTypo(.h4)
                Text("Typography h5").brTypo(.h5)
                Text("Typography h6").brTypo(.h6)
            }
            Group {
                Text("Typography h1").brTypo(.s1)
                Text("Typography h2").brTypo(.s2)
                
                Text("Typography p1").brTypo(.p1)
                Text("Typography p2").brTypo(.p2)
                
                Text("Typography c1").brTypo(.c1)
                Text("Typography c2").brTypo(.c2)
            }
        }
    }
}

