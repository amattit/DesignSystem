//
//  File.swift
//  
//
//  Created by MikhailSeregin on 28.01.2022.
//

import SwiftUI

public struct BRRadioButton: View {
    public init(isChecked: Bool, color: Color? = nil, text: String = "") {
        self.isChecked = isChecked
        self.color = color
        self.text = text
    }
    
    var isChecked: Bool
    var color: Color?
    var text: String = ""
    
    private var colorToUse: Color? { isEnabled ? color : .brFontDisabled }
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    public var body: some View {
        HStack(spacing: text.isEmpty ? 0 : 6) {
            isChecked ? AnyView(CheckedButton(color: colorToUse ?? .brPrimary)) : AnyView(UncheckedButton(color: colorToUse ?? .brBasic))
            Text(text)
        }
    }
}

private struct CheckedButton: View {
    var color: Color = .brPrimary
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 20, height: 20)
            Circle()
                .fill(Color.white)
                .frame(width: 18, height: 18)
            Circle()
                .fill(color)
                .frame(width: 12, height: 12)
        }
    }
}

private struct UncheckedButton: View {
    var color: Color = .brBasic
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 20, height: 20)
            Circle()
                .fill(Color.white)
                .frame(width: 18, height: 18)
            Circle()
                .fill(color.opacity(0.1))
                .frame(width: 18, height: 18)
        }
    }
}


struct RadioButton_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack(alignment: .leading, spacing: 12) {
            BRRadioButton(isChecked: true)
            BRRadioButton(isChecked: false)
            BRRadioButton(isChecked: true).disabled(true)
            BRRadioButton(isChecked: false).disabled(true)
            BRRadioButton(isChecked: false, color: .brDanger)
            BRRadioButton(isChecked: false, color: .brWarning)
            BRRadioButton(isChecked: false, color: .brSuccess)
            BRRadioButton(isChecked: true, text: "Text")
            BRRadioButton(isChecked: true, color: .brWarning, text: "Text and custom color")
        }
    }
}

