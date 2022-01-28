//
//  File.swift
//  
//
//  Created by MikhailSeregin on 28.01.2022.
//


import SwiftUI

extension Color {
    
    // MARK: Basic Colors
    
    public static let brBackground = Color("background", bundle: .module)
    public static let brBasic = Color("basic", bundle: .module)
    public static let brPrimary = Color("primary", bundle: .module)
    
    // MARK: Font Colors
    
    /// Standard Font Color
    public static let brFontStd = Color("font_std", bundle: .module)
    /// Hint Font Color
    public static let brFontHint = Color("font_hint", bundle: .module)
    /// Disabled Font Color
    public static let brFontDisabled = Color("font_disabled", bundle: .module)
    /// Button Font Color
    public static let brFontBtn = Color("font_button", bundle: .module)
    
    // MARK: Semantic Colors
    
    public static let brDanger = Color("danger", bundle: .module)
    public static let brInfo = Color("info", bundle: .module)
    public static let brSuccess = Color("success", bundle: .module)
    public static let brWarning = Color("warning", bundle: .module)
    
    // MARK: State Colors
    
    /// Active State Color - Primary Style
    public static let brActivePrimary = Color("activePrimary", bundle: .module)
    /// Active State Color - Basic Style
    public static let brActiveBasic = Color("activeBasic", bundle: .module)
}

struct Color_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack{
                Rectangle().size(CGSize(width: 50, height: 50))
                    .foregroundColor(.brBasic)
                Rectangle().size(CGSize(width: 50, height: 50))
                    .foregroundColor(.brPrimary)
                Rectangle().size(CGSize(width: 50, height: 50))
                    .foregroundColor(.brSuccess)
                Rectangle().size(CGSize(width: 50, height: 50))
                .foregroundColor(.brInfo)
                Rectangle().size(CGSize(width: 50, height: 50))
                .foregroundColor(.brWarning)
                Rectangle().size(CGSize(width: 50, height: 50))
                .foregroundColor(.brDanger)
            }
            Text("Hello, World!")
                .foregroundColor(.brActivePrimary)
                .background(Color.brActiveBasic)
                .environment(\.colorScheme, .dark)
        }
    .padding()
    }
}

