//
//  SwiftUIView.swift
//  Eatlist
//
//  Created by JarvanSun on 2022/11/23.
//

import SwiftUI

private struct PreviewColorSchemes: ViewModifier {
    func body(content: Content) -> some View {
        ForEach(ColorScheme.allCases, id: \.self) { scheme in
            content.preferredColorScheme(scheme)
        }
    }
}

extension View {
    func previewColorSchemes() -> some View {
        modifier(PreviewColorSchemes())
    }
}
