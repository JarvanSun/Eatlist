//
//  ItemView.swift
//  Eatlist
//
//  Created by JarvanSun on 2022/11/23.
//

import SwiftUI
import PhotosUI

struct ItemView: View {
    @Binding var item: Item
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        VStack(spacing: 16) {
            PhotosPicker(selection: $selectedItem, matching: .images, label: photosPickerLabel)
                .onChange(of: selectedItem) { selectedItemDidChange($0) }
            
            TextField("Name", text: $item.name)
                .font(.title.weight(.heavy))
                .multilineTextAlignment(.center)
                .padding(.vertical)
            
            Spacer()
        }
        .padding(32)
    }
    
    @ViewBuilder
    private func photosPickerLabel() -> some View {
        Card {
            ZStack {
                if let photoData = item.imageData, let image = UIImage(data: photoData) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                } else {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxHeight: 210)
            .transition(.opacity)
            .animation(.default, value: item.imageData)
        }
    }
    
    @MainActor
    private func selectedItemDidChange(_ newItem: PhotosPickerItem?) {
        Task {
            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                item.imageData = data
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    @StateObject static var model = LandingViewModelImpl()
    
    static var previews: some View {
        ItemView(item: $model.itemToAdd)
            .previewColorSchemes()
    }
}
