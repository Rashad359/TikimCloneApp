//
//  RoundedRectangleStyleModifier.swift
//  Tikim
//
//  Created by Rashad on 07.05.26.
//

import SwiftUI

struct RoundedRectangleStyleModifier: ViewModifier {
    var cornerRadius: CGFloat

    var backgroundColor: AnyShapeStyle

    var borderColor: AnyShapeStyle
    
    var borderWidth: CGFloat = 2

    func body(content: Content) -> some View {
        let shape = RoundedRectangle(cornerRadius: cornerRadius)

        return content
            .background(
                shape.fill(backgroundColor)
            )
            .overlay(
                shape.stroke(borderColor, lineWidth: borderWidth)
            )
            .clipShape(shape)
    }
}

extension View {
    func roundedRectangleStyle(
        cornerRadius: CGFloat,
        backgroundColor: any ShapeStyle = Color.clear,
        borderColor: any ShapeStyle = .clear,
        borderWidth: CGFloat = 2
    ) -> some View {
        modifier(
            RoundedRectangleStyleModifier(
                cornerRadius: cornerRadius,
                backgroundColor: AnyShapeStyle(backgroundColor),
                borderColor: AnyShapeStyle(borderColor),
                borderWidth: borderWidth
            )
        )
    }
}
