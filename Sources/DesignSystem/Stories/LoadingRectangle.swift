//
//  LoadingRectangle.swift
//  HappyBrain
//
//  Created by Михаил Серегин on 21.04.2021.
//  Copyright © 2021 Mikhail Seregin. All rights reserved.
//

import SwiftUI

struct LoadingRectangle: View {
    
    var progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.3))
                    .cornerRadius(5)

                Rectangle()
                    .frame(width: geometry.size.width * self.progress, height: nil, alignment: .leading)
                    .foregroundColor(Color.white.opacity(0.9))
                    .cornerRadius(5)
            }
        }
    }
}

struct LoadingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        LoadingRectangle(progress: 0.8)
            .background(Color.gray)
    }
}
