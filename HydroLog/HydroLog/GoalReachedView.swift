//
//  GoalReachedView.swift
//  HydroLog
//
//  Created by Rudhra T on 2/10/2026.
//

import SwiftUI

struct GoalReachedView: View {
    @Binding var isPresented: Bool
    @State private var isAnimating = false

    var body: some View {
        VStack {
            Image(systemName: "party.popper.fill")
                .font(.system(size: 64))
                .foregroundStyle(.cyan)
                .rotationEffect(.degrees(isAnimating ? 10 : -10))
                .animation(.default, value: isAnimating)
                .onAppear {
                    isAnimating = true
                }
            
            Text("Hoorah!")
                .font(.largeTitle)
                .padding(.top, 100)
                .bold()
            
            Text("You have reached your water goal, ")
                .font(.callout)
                .padding(.top)
            
            Text("no need to drink anymore!")
                .font(.callout)
            
            Button {
                withAnimation(.default) {
                    isPresented = false
                }
            } label: {
                Label("Back", systemImage: "chevron.left")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.plain)
            .foregroundStyle(.accent)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
            
        }
    }
}
