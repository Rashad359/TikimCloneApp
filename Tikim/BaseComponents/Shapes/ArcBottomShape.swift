//
//  ArcBottomShape.swift
//  Tikim
//
//  Created by Rashad on 19.04.26.
//

import SwiftUI

struct ArcBottomShape: Shape {
    var arcHeight: CGFloat = 24
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // Arc across the bottom
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY),
            control: CGPoint(x: rect.midX, y: rect.maxY + arcHeight)
        )
        
        path.closeSubpath()
        return path
    }
}
