//
//  CategoryItemView.swift
//  BankApp
//
//  Created by Darya Zhitova on 29.08.2022.
//

import SwiftUI

struct CategoryItemView: View {
    
    var item: CategoryModel
    
    var body: some View {
        
        return Color.clear.overlay(
        
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                VStack(alignment: .leading) {
                    Text(item.title)
                    
                    Spacer()
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.gray.opacity(0.1))
                            .frame(width: 130)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color(item.color))
                            .frame(width: CGFloat(item.percent) * 1.3)
                    }
                    .frame(height: 15)
                }
                .padding()
            }
            .frame(width: 160, height: 100)
        
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .contentShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .gray.opacity(0.25), radius: 4, x: 4, y: 4)
        .frame(width: 160, height: 100)
    }
}
