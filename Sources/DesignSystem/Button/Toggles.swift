//
//  File.swift
//  
//
//  Created by MikhailSeregin on 28.01.2022.
//

import SwiftUI

public struct BRToggle: View {
    
    enum Style {
        case defaultStyle, primary, disabled, success, warning, danger, info
    }
    
    @Binding var toggleState: Bool
    var style: Style
    var text: String?
    
    struct ColoredToggleStyle: ToggleStyle {
        var onColor = Color.brPrimary
        var offColor = Color.brDanger
        var thumbColor = Color.white
        
        func makeBody(configuration: Self.Configuration) -> some View {
            Button(action: { configuration.isOn.toggle() } ) {
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 29)
                    .overlay(
                        ZStack {
                            Circle()
                                .fill(thumbColor)
                                .shadow(radius: 1, x: 0, y: 1)
                                .padding(1.5)
                                .offset(x: configuration.isOn ? 10 : -10)
                            Image(systemName: configuration.isOn ? "checkmark" : "")
                                .font(.system(size: 12, weight: .black))
                                .foregroundColor(onColor)
                                .offset(x: configuration.isOn ? 10 : -10)
                            
                        }
                    )
                    .animation(.easeInOut(duration: 0.1))
            }
            .font(.title)
            .padding(.horizontal)
        }
    }
    
    
    public var body: some View {
        switch style {
        case .primary: return AnyView(primary())
        case .success: return AnyView(success())
        case .warning: return AnyView(warning())
        case .danger: return AnyView(danger())
        case .info: return AnyView(info())
        default: return AnyView(defaultStyle())
        }
    }
    
    
    fileprivate func defaultStyle() -> some View {
        Toggle(text ?? "", isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: .brBasic,
                    offColor: Color.brBasic.opacity(0.1),
                    thumbColor: .white))
    }
    
    fileprivate func primary() -> some View {
        Toggle(text ?? "", isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: .brPrimary,
                    offColor: Color.brPrimary.opacity(0.1),
                    thumbColor: .white))
    }
    
    fileprivate func success() -> some View {
        Toggle(text ?? "", isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: .brSuccess,
                    offColor: Color.brSuccess.opacity(0.1),
                    thumbColor: .white))
    }
    
    fileprivate func info() -> some View {
        Toggle(text ?? "", isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: .brInfo,
                    offColor: Color.brInfo.opacity(0.1),
                    thumbColor: .white))
    }
    
    
    fileprivate func warning() -> some View {
        Toggle(text ?? "", isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: .brWarning,
                    offColor: Color.brWarning.opacity(0.1),
                    thumbColor: .white))
    }
    
    
    fileprivate func danger() -> some View {
        Toggle(text ?? "", isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: .brDanger,
                    offColor: Color.brDanger.opacity(0.1),
                    thumbColor: .white))
    }
}

struct Toggles_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BRToggle(toggleState: .constant(false), style: .defaultStyle)
            BRToggle(toggleState: .constant(true), style: .primary)
            BRToggle(toggleState: .constant(false), style: .success)
            BRToggle(toggleState: .constant(true), style: .info)
            BRToggle(toggleState: .constant(true), style: .warning)
            BRToggle(toggleState: .constant(true), style: .danger)
        }
    }
}

