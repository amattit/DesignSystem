//
//  File.swift
//  
//
//  Created by MikhailSeregin on 28.01.2022.
//

import SwiftUI

public struct Checkbox: View {
    public init(checkboxState: Binding<Bool>, style: Checkbox.Style, text: String? = nil) {
        self._checkboxState = checkboxState
        self.style = style
        self.text = text
    }
        
    public enum Style {
        case defaultStyle, primary, disabled, success, warning, danger, info
    }
    
    @Binding var checkboxState: Bool
    let style: Style
    var text: String?
    
    struct ColoredCheckboxStyle: ToggleStyle {
        var onColor = Color.brPrimary
        var offColor = Color.brFontDisabled
        
        func makeBody(configuration: Self.Configuration) -> some View {
            return HStack {
                configuration.label
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .onTapGesture { configuration.isOn.toggle() }
                .foregroundColor(configuration.isOn ? onColor : offColor)
            }
            
        }
    }
    
    
    public var body: some View {
        switch style {
        case .success: return AnyView(success())
        case .primary: return AnyView(primary())
        case .warning: return AnyView(warning())
        case .danger: return AnyView(danger())
        case .info: return AnyView(info())
        default: return AnyView(defaultStyle())
        }
    }
    
    
    fileprivate func defaultStyle() -> some View {
        Toggle(text ?? "", isOn: $checkboxState)
            .toggleStyle(ColoredCheckboxStyle(onColor: .brBasic, offColor: .brFontDisabled))
    }
    
    fileprivate func primary() -> some View {
        Toggle(text ?? "", isOn: $checkboxState)
            .toggleStyle(ColoredCheckboxStyle(onColor: .brPrimary, offColor: .brFontDisabled))
    }
    
    fileprivate func success() -> some View {
            Toggle(text ?? "", isOn: $checkboxState)
            .toggleStyle(ColoredCheckboxStyle(onColor: .brSuccess, offColor: .brFontDisabled))
    }
    
    fileprivate func info() -> some View {
        Toggle(text ?? "", isOn: $checkboxState)
        .toggleStyle(ColoredCheckboxStyle(onColor: .brInfo, offColor: .brFontDisabled))
    }
    
    
    fileprivate func warning() -> some View {
        Toggle(text ?? "", isOn: $checkboxState)
        .toggleStyle(ColoredCheckboxStyle(onColor: .brWarning, offColor: .brFontDisabled))
    }
    
    
    fileprivate func danger() -> some View {
        Toggle(text ?? "", isOn: $checkboxState)
        .toggleStyle(ColoredCheckboxStyle(onColor: .brDanger, offColor: .brFontDisabled))
    }
}


struct Checkboxes_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .trailing, spacing: 10){
            Checkbox(
                checkboxState: .constant(true),
                style: .defaultStyle,
                text: "some text"
            )
            Checkbox(checkboxState: .constant(true), style: .primary)
            Checkbox(checkboxState: .constant(true), style: .success)
            Checkbox(checkboxState: .constant(true), style: .info)
            Checkbox(checkboxState: .constant(true), style: .warning)
            Checkbox(checkboxState: .constant(true), style: .danger)
        }
    }
}

