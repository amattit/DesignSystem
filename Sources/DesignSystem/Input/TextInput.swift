//
//  File.swift
//  
//
//  Created by MikhailSeregin on 28.01.2022.
//

import SwiftUI

public struct BRTextField: View {
    public enum Style {
        case defaultStyle, primary, disabled, success, warning, danger, info
    }
    
    var style: Style
    var placeholder: String
    var icon: Image? = nil
    var commit: ()->() = { }
    @State private var focused: Bool = false
    @Binding var input: String
    
    // MARK: Inits
    
    public init(_ text: Binding<String>, placeholder: String, onCommit: @escaping ()->() = { }) {
        self._input = text
        self.placeholder = placeholder
        self.style = .defaultStyle
        self.commit = onCommit
    }
    
    public init(_ text: Binding<String>, placeholder: String, style: Style, onCommit: @escaping ()->() = { }) {
        self._input = text
        self.placeholder = placeholder
        self.style = style
        self.commit = onCommit
    }
    
    public init(_ text: Binding<String>, placeholder: String, icon: Image, onCommit: @escaping ()->() = { }) {
        self._input = text
        self.placeholder = placeholder
        self.icon = icon
        self.style = .defaultStyle
        self.commit = onCommit
    }
    
    public init(_ text: Binding<String>, placeholder: String, style: Style, icon: Image, onCommit: @escaping ()->() = { }) {
        self._input = text
        self.placeholder = placeholder
        self.style = style
        self.icon = icon
        self.commit = onCommit
    }
    
    // MARK:  Function declarations
    
    fileprivate func defaultStyle() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(.brBasic) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit).foregroundColor(.brFontStd)
            }
            if focused { icon.imageScale(.large).foregroundColor(.brPrimary) }
            else { icon.imageScale(.large).foregroundColor(.brBasic) }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color.brBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(self.focused ? Color.brPrimary : Color.brBasic.opacity(0.4), lineWidth: 1))
    }
    
    fileprivate func primary() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(.brPrimary) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit).foregroundColor(.brFontStd)
            }
             icon.imageScale(.large).foregroundColor(.brPrimary)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color.brBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(Color.brPrimary, lineWidth: 1))
    }
    
    fileprivate func success() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(.brBasic) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit).foregroundColor(.brFontStd)
            }
            icon.imageScale(.large).foregroundColor(.brSuccess)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color.brBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(Color.brSuccess, lineWidth: 1))
    }
    
    fileprivate func warning() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(Color.brBasic) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit).foregroundColor(.brFontStd)
            }
            icon.imageScale(.large).foregroundColor(.brWarning)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color.brBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(Color.brWarning, lineWidth: 1))
    }
    
    fileprivate func danger() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(.brBasic) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit).foregroundColor(.brFontStd)
            }
            icon.imageScale(.large).foregroundColor(.brDanger)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color.brBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(Color.brDanger, lineWidth: 1))
    }
    
    fileprivate func info() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(.brBasic) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit).foregroundColor(.brFontStd)
            }
            icon.imageScale(.large).foregroundColor(.brInfo)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color.brBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(Color.brInfo, lineWidth: 1))
    }
    
    // MARK:  Body
    
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
}

// MARK: Preview

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            BRTextField(.constant("123") , placeholder: "Thats a default Textfield", onCommit: {print("party")})
            BRTextField(.constant("") , placeholder: "Thats a default Textfield + Icon", icon: Image(systemName: "star.fill"), onCommit: {print("party")})
            BRTextField(.constant("") , placeholder: "Primary", style: .primary, icon: Image(systemName: "star.fill"))
            BRTextField(.constant("") , placeholder: "Success", style: .success, icon: Image(systemName: "star.fill"))
            BRTextField(.constant("") , placeholder: "Warning", style: .warning, icon: Image(systemName: "star.fill"))
            BRTextField(.constant("") , placeholder: "Danger", style: .danger, icon: Image(systemName: "star.fill"))
            BRTextField(.constant("") , placeholder: "Info", style: .info, icon: Image(systemName: "star.fill"))
        }
        .padding()
    }
}
