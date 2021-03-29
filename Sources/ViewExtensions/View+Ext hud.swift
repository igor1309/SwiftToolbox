//
//  View+Ext makeHUD.swift
//  TokenizedReportUIApp
//
//  Created by Igor Malyarov on 02.03.2021.
//

import SwiftUI

extension View {
    func hud<Content: View>(isShowing: Binding<Bool>,
                            dismissAfter: TimeInterval = 3,
                            @ViewBuilder hudView: () -> Content) -> some View {
        ZStack(alignment: .top) {
            self

            if isShowing.wrappedValue {
                hudView()
                    .padding()
                    .background(
                        Capsule()
                            .foregroundColor(.white)
                            .shadow(color: Color(.black).opacity(0.16), radius: 10, x: 0, y: 5)
                    )
                    .padding()
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + dismissAfter) {
                            withAnimation {
                                isShowing.wrappedValue = false
                            }
                        }
                    }
            }
        }
    }
}

@available(macOS 11.0, *)
struct View_Ext_makeHUD: View {
    @State private var isShowing = true

    var body: some View {
        ZStack {
            Color.orange.opacity(0.1)
                .hud(isShowing: $isShowing) {
                    Label("Simple HUD", systemImage: "star.fill")
                }

            Button {
                withAnimation {
                    isShowing.toggle()
                }
            } label: {
                Text("Toggle")
            }
        }
    }
}

@available(macOS 11.0, *)
struct View_Ext_makeHUD_Previews: PreviewProvider {
    static var previews: some View {
        View_Ext_makeHUD()
    }
}
