//
//  StarViewRepresentations.swift
//  MoviesApp
//
//  Created by Arpit Dixit on 08/07/21.
//

import Foundation
import SwiftUI

struct StarViewRepresentation: UIViewRepresentable {
    
    @Binding var selected: Bool
    
    typealias UIViewType = StarView
    
    func makeUIView(context: Context) -> StarView {
        let starView = StarView()
        return starView
    }
    
    func updateUIView(_ uiView: StarView, context: Context) {
        uiView.selected = selected
    }
}
