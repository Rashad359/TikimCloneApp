//
//  TechSpecs.swift
//  Tikim
//
//  Created by Rashad on 20.04.26.
//

import SwiftUI

struct TechnicalSpecs: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Technical Specifications")
                .bold()
            
            Divider()
            
            SpecTable(title: "Voltage Rating", description: "450/750V")
            
            Divider()
            
            SpecTable(title: "Conductor Material", description: "Copper")
            
            Divider()
            
            SpecTable(title: "Voltage Rating", description: "PVC")
            
            Divider()
            
            SpecTable(title: "Voltage Rating", description: "-15C to +70C")
            
            Divider()
            
            SpecTable(title: "Standard", description: "IEC 60227")
        }
        .frame(maxWidth: .infinity)
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.grayBorder, lineWidth: 1)
        )
    }
}

#Preview {
    TechnicalSpecs()
}

struct SpecTable: View {
    
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(Color.gray)
            
            Spacer()
            
            Text(description)
        }
    }
}
