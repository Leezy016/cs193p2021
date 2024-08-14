//
//  Pie.swift
//  Memorize
//
//  Created by Rice on 2024/8/14.
//

import SwiftUI

struct Pie : Shape {
    var startAngle : Angle
    var endAngle : Angle
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width,rect.height)/2
        var start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        var end = CGPoint(
            x: 0,
            y: 0
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        p.addLine(to: center)
        return p
    }
}
