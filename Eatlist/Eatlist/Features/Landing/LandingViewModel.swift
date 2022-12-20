//
//  LandingViewModel.swift
//  Eatlist
//
//  Created by JarvanSun on 2022/11/23.
//

import SwiftUI

protocol LandingViewModel: ObservableObject {
    var isItemViewPresenting: Bool { get set }
    var itemToAdd: Item { get set }
    
    func addButtonTapped()
    func cancelButtonTapped()
    func commit()
}

final class LandingViewModelImpl: LandingViewModel {
    @Published var itemToAdd: Item = .empty
    @Published var isItemViewPresenting = false {
        didSet {
            if !isItemViewPresenting && oldValue { itemToAdd = .empty }
        }
    }
    
    private let resolver: LandingViewResolving
    
    init(resolver: LandingViewResolving = LandingViewResolver()) {
        self.resolver = resolver
    }
    
    func addButtonTapped() {
        itemToAdd = .empty
        isItemViewPresenting = true
    }
    
    func cancelButtonTapped() {
        isItemViewPresenting = false
    }
    
    func commit() {
        saveItem()
        isItemViewPresenting = false
    }
    
    private func saveItem() {
        let newItem = itemToAdd
        
        // TODO: Store item
    }
}
