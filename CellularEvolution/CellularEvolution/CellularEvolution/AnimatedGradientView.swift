//
//  AnimatedGradientView.swift
//  CellularEvolution
//
//  Created by nastasya on 21.06.2024.
//

import SwiftUI

struct AnimatedGradientView: View {
    @State var startColors: [Color] = [.green, .yellow]
    @State var endColors: [Color] = [.orange, .yellow, .mint]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: startColors),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            startAnimation()
        }
    }
    
    private func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            withAnimation(Animation.linear(duration: 3).repeatForever()) {
                startColors = endColors
            }
        }
    }
}

#Preview {
    AnimatedGradientView()
}
