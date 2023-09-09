//
//  SettingsView.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var router
    
    @State var isDelete: Bool = false
    
    @AppStorage("name") var name: String = ""
    @AppStorage("password") var password: String = ""
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, content: {
                    
                    Text("Data")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .padding(.bottom)
                    
                    VStack(alignment: .leading, content: {
                        
                        Text("Login")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 13 ,weight: .regular))
                                .opacity(name.isEmpty ? 1 : 0)
                            
                            TextField("", text: $name)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    })
                })
                .padding()
                .padding(.top)
                
                Spacer()
                
                Button(action: {
                    
                    isDelete = true
                    
                }, label: {
                    
                    Text("Delete Account")
                        .foregroundColor(.red)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                })
            }
        }
        .alert(isPresented: $isDelete) {
            
            Alert(
                title: Text("Delete Account"),
                message: Text("Are you sure you want to delete the account? This action cannot be undone."),
                primaryButton: .destructive(Text("Delete")) {
                    // Обработчик для удаления аккаунта
                    // Вставьте свой код для удаления аккаунта здесь
                    router.wrappedValue.dismiss()
                    status = false
                },
                secondaryButton: .cancel()
            )
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
