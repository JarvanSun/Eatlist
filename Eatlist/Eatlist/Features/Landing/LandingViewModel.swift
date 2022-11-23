//
//  LandingViewModel.swift
//  Eatlist
//
//  Created by JarvanSun on 2022/11/23.
//

import SwiftUI

protocol LandingViewModel: ObservableObject {
    var isPresentingItemView: Bool { get set }
    var itemToAdd: Item { get set }
    
    func addButtonTapped()
    func cancelButtonTapped()
    func commit()
}


class LandingViewModelImpl: LandingViewModel {
    @Published var itemToAdd: Item = .empty
    @Published var isPresentingItemView = false {
        didSet {
            if !isPresentingItemView && oldValue { itemToAdd = .empty }
        }
    }
    
    func addButtonTapped() {
        itemToAdd = .empty
        isPresentingItemView = true
    }
    
    func cancelButtonTapped() {
        isPresentingItemView = false
    }
    
    func commit() {
        isPresentingItemView = false
    }
}

