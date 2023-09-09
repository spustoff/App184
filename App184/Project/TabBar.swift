//
//  TabBar.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var isAdd: Bool
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    if index != .Add {
                        
                        selectedTab = index
                        
                    } else {
                        
                        isAdd = true
                    }
                    
                }, label: {
                    
                    if index != .Add {
                        
                        VStack(alignment: .center, spacing: 10, content: {
                            
                            Image(index.rawValue)
                                .renderingMode(.template)
                                .foregroundColor(selectedTab == index ? Color("primary") : .gray)
                            
                            Text(index.rawValue)
                                .foregroundColor(selectedTab == index ? Color("primary") : .gray)
                                .font(.system(size: 11, weight: .medium))
                        })
                        .frame(maxWidth: .infinity)
                        
                    } else {
                        
                        Image(index.rawValue)
                            .padding(.horizontal, 7)
                    }
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 9)
        .padding(.bottom, 31)
        .background(Color.gray.opacity(0.05))
    }
}

enum Tab: String, CaseIterable {
    
    case Community = "Community"
    
    case Add = "Add"
    
    case Ideas = "Ideas"
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
