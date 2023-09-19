//
//  Users_5.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI

struct Users_5: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_5")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 9, content: {
                    
                    Text("Don't miss anything important")
                        .foregroundColor(.white)
                        .font(.system(size: 21, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Get the most up-to-date information")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Enable Notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 31/255, green: 90/255, blue: 202/255)))
                        .padding()
                })
            }
            .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .padding(11)
                            .background(Circle().fill(.gray.opacity(0.3)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct Users_5_Previews: PreviewProvider {
    static var previews: some View {
        Users_5()
    }
}
