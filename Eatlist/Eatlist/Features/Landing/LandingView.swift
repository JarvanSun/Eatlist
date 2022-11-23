//
//  LandingView.swift
//  Eatlist
//
//  Created by JarvanSun on 2022/11/23.
//

import SwiftUI

struct LandingView<ViewModel>: View where ViewModel: LandingViewModel {
    @StateObject private var model: ViewModel
    
    init(_ model: ViewModel) {
        _model = StateObject(wrappedValue: model)
    }
    
    var body: some View {
        ScrollView {
            ScrolledContent()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: model.addButtonTapped) {
                    Image(systemName: "plus")
                        .font(.headline)
                        .padding(6)
                }
                .buttonStyle(.plain)
            }
        }
        .sheet(isPresented: $model.isPresentingItemView) {
            NavigationStack {
                ItemView(item: $model.itemToAdd)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel", action: model.cancelButtonTapped)
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save", action: model.commit)
                        }
                    }
            }
            
        }
    }
}

extension LandingView {
    struct ScrolledContent: View {
        private let gridItemLayout = [
            GridItem(.flexible(), spacing: 12),
            GridItem(.flexible())
        ]
        
        var body: some View {
            LazyVGrid(columns: gridItemLayout) {
                ForEach(1...5, id: \.self) { item in
                    FoodCard()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        HostView()
            .previewColorSchemes()
    }
}
