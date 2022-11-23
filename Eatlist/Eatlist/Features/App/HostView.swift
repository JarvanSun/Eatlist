//
//  HostView.swift
//  Eatlist
//
//  Created by JarvanSun on 2022/11/23.
//

import SwiftUI

struct HostView: View {
    var body: some View {
        NavigationStack {
            LandingView(LandingViewModelImpl())
                .navigationTitle("Eatlist")
        }
    }
}

struct HostView_Previews: PreviewProvider {
    static var previews: some View {
        HostView()
    }
}
