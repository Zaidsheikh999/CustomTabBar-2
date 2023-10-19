//
//  TabBar.swift
//  CustomTabBar2
//
//  Created by Zaid Sheikh on 19/10/2023.
//

import SwiftUI

struct TabBar: View {
    let darkBackground = UIColor(red: 0.000, green: 0.576, blue: 0.580, alpha: 1.0)

    @ObservedObject var tabItems = TabItems.shared
    
    @State private var circleSize: CGFloat = 50
    @State private var iconeSize: CGFloat = 25
    
    var body: some View {
        ZStack {
            Color(darkBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ZStack {
                    Bar(tab: tabItems.selectedTabIndex)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                        .animation(.spring(response: 0.5, dampingFraction: 0.5))
                    HStack(spacing: (UIScreen.main.bounds.width - (CGFloat(TabItems.shared.items.count + 1) * self.circleSize)) / (CGFloat(TabItems.shared.items.count) + 1)) {
                        ForEach(0..<tabItems.items.count, id: \.self) { i in
                            ZStack {
                                Circle()
                                    .frame(width: self.circleSize, height: self.circleSize)
                                    .foregroundColor(.white)
                                    .animation(.spring(response: 0.5, dampingFraction: 0.4))
                                    .onTapGesture {
                                        self.tabItems.select(i)
                                        
                                        // Code to change tab screen can go here...
                                        
                                    }
                                Image(systemName: self.tabItems.items[i].imageName)
                                    .resizable()
                                    .foregroundColor(Color(self.darkBackground))
                                    .frame(width: self.iconeSize, height: self.iconeSize)
                                    .opacity(self.tabItems.items[i].opacity)
                                    .animation(.spring(response: 0.5, dampingFraction: 0.4))
                            }
                            .offset(y: self.tabItems.items[i].offset)
                            
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
