//
//  Reviewers_4.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI

struct Reviewers_4: View {
    
    @AppStorage("status") var status: Bool = false
    
    @State var current_type: AuthTypes = .register
    
    @State var name_temp: String = ""
    @State var password_temp: String = ""
    
    @AppStorage("name") var name: String = ""
    @AppStorage("password") var password: String = ""
    
    var body: some View {
        
        ZStack {
            
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Image("chart")
                
                Spacer()
            }
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        VStack {
                            
                            VStack(spacing: 8, content: {
                                
                                Text(current_type == .register ? "Welcome" : "Welcome back!")
                                    .foregroundColor(.white)
                                    .font(.system(size: 23, weight: .semibold))
                                
                                Text(current_type == .register ? "Sign Up complete with other users" : "Log in complete with other users")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            .padding(.bottom, 40)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(name_temp.isEmpty ? 1 : 0)
                                
                                TextField("", text: $name_temp)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Password")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(password_temp.isEmpty ? 1 : 0)
                                
                                TextField("", text: $password_temp)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            .padding(.bottom)
                            
                            Button(action: {
                                
                                password = password_temp
                                name = name_temp
                                
                                status = true
                                
                            }, label: {
                                
                                Text(current_type == .register ? "Sign Up" : "Log In")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14 ,weight: .medium))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            })
                            .opacity(name_temp.isEmpty || password_temp.isEmpty ? 0.5 : 1)
                            .disabled(name_temp.isEmpty || password_temp.isEmpty ? true : false)
                            
                            Button(action: {
                                
                                if current_type == .login {
                                    
                                    current_type = .register
                                    
                                } else {
                                    
                                    current_type = .login
                                }
                                
                            }, label: {
                                
                                Text(current_type == .register ? "Or Log In" : "Or Sign Up")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14 ,weight: .medium))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                            })
                        }
                    }
                }
            }
            .padding()
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.height / 1.3, alignment: .top)
            .background(Color("bg").ignoresSafeArea())
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

enum AuthTypes: CaseIterable {
    
    case login, register
}

struct Reviewers_4_Previews: PreviewProvider {
    static var previews: some View {
        Reviewers_4()
    }
}
