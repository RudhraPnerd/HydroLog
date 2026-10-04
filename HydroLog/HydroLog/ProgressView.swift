//
//  ProgressView.swift
//  HydroLog
//
//  Created by Rudhra T on 2/10/2026.
//

import SwiftUI

struct ProgressView: View {
    var Value: Double
    var Total: Double
    
    private var progressRatio: Double{
        guard Total > 0 else { return 0 }
        return min(max(Value / Total, 0), 1)
    }
    
    var body: some View {
        GeometryReader{geometry in
            ZStack(alignment: .leading){
                
                
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 20)
                
                Capsule()
                    .fill(Color.cyan)
                    .frame(width: geometry.size.width * progressRatio, height: 20)
                    .animation(.easeInOut(duration: 0.3), value: Value)
            }
            
        }
        .frame(height: 12)
    }
}
