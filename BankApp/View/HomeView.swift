//
//  HomeView.swift
//  BankApp
//
//  Created by Darya Zhitova on 12.08.2022.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selectedItem: CategoryModel?
    @State private var blur = false
    
    
    @State private var coloumns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        
        VStack {
            
            if self.selectedItem == nil {
            
                Header()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(CardModel.colors) { colors in
                            VStack {
                                GeometryReader { geo in
                                    CardItemView(colors: colors.colors)
                                        .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 15), axis: (x: 0, y: 1, z: 0))
                                }
                                .frame(width: 250, height: 250)
                            }
                        }
                    }
                }
            }
            
            ZStack(alignment: .center) {
                LazyVGrid(columns: coloumns, spacing: 10) {
                    ForEach(CategoryModel.categories) { item in
                        CategoryItemView(item: item)
                            .onLongPressGesture {
                                tapToCategory(item)
                            }
                        
                    }
                }
                .zIndex(1)
                
                if blur {
                    VisualBlurEffect(uiVisualEffect: UIBlurEffect(style: .systemUltraThinMaterial))
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            tapToBack()
                        }
                        .zIndex(2)
                }
                
                if self.selectedItem != nil {
                    CategoryDetailView(item: self.selectedItem!)
                        .zIndex(3)
                }
                
            }
            .offset(y: selectedItem == nil ? -50 : 0)
            .frame(maxWidth: .infinity, maxHeight: selectedItem == nil ? 250 : .infinity)
            
            if selectedItem == nil  {
                Button {
                    print("Button is tapped")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                        Text("Open a new card")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 42)
                .padding(32)

            }
            
            Spacer()
            
        }
        .background(.gray.opacity(0.05))
    }
    
    
    @ViewBuilder
    
    private func Header() -> some View {
        
        HStack {
            
            Text("Welcome back,\nIvan!")
                .font(.system(size: 22, weight: .bold, design: .default))
                .foregroundColor(.accentColor)
            
            Spacer()
            
            ZStack {
                
                Circle()
                    .foregroundColor(Color("lightGreen"))
                
                Image("memoji")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 55, height: 55)
            
        }
        .padding([.trailing, .leading])
    }
    
    func tapToBack() {
        withAnimation(.easeInOut) { self.blur = false }
        
        
        DispatchQueue.main.async {
            withAnimation(.easeInOut) { self.selectedItem = nil }
        }
    }
    
    
    func tapToCategory(_ item: CategoryModel) {
        withAnimation(.easeInOut) { self.selectedItem = item }
        
        
        DispatchQueue.main.async {
            withAnimation(.easeInOut) { self.blur = true }
        }
    }
    
    
    
    
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedItem: .constant(nil))
    }
}
