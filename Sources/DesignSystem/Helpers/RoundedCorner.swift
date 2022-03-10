//
//  File.swift
//  
//
//  Created by MikhailSeregin on 28.01.2022.
//

import SwiftUI

public enum RectCorner {
    case topLeft, topRight, bottomLeft, bottomRight, allCorners
}

public extension View {
    
    // function for CornerRadius struct
    @available(iOS 13.0, *)
    @ViewBuilder
    func cornerRadius(_ radius: CGFloat, corners: RectCorner) -> some View {
        switch corners {
        case .topLeft:
            clipShape( RoundedCorner(radius: radius, corners: .topLeft) )
        case .topRight:
            clipShape( RoundedCorner(radius: radius, corners: .topRight) )
        case .bottomLeft:
            clipShape( RoundedCorner(radius: radius, corners: .bottomLeft) )
        case .bottomRight:
            clipShape( RoundedCorner(radius: radius, corners: .bottomRight) )
        case .allCorners:
            clipShape( RoundedCorner(radius: radius, corners: .allCorners) )
        }
    }
    
    @available(macOS 10.15, *)
    func cornerRadius(_ radius: CGFloat) -> some View {
        clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
    }
}

/// Custom shape with independently rounded corners
@available(iOS 13, *)
public struct RoundedCorner: Shape {
    public init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }
    

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func smoothingCornerRadius(_ radius: CGFloat) -> some View {
        clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
    }
}
