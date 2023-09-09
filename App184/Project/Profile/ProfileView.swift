//
//  ProfileView.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI
import StoreKit

struct ProfileView: View {
    
    @AppStorage("name") var name: String = ""
    
    @StateObject var viewModel = ProfileViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isMenu = true
                            }
                            
                        }, label: {
                            
                            Image("menu")
                        })
                    }
                    
                    Text("Profile")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        HStack {
                            
                            Image("ava")
                            
                            VStack(alignment: .leading, spacing: 7, content: {
                                
                                Text("Wise Investor")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text(name)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            })
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 6, content: {
                                
                                Text("\(viewModel.tips.count)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Tips")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.system(size: 12, weight: .regular))
                            })
                            
                            VStack(alignment: .center, spacing: 6, content: {
                                
                                Text("0")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Comments")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.system(size: 12, weight: .regular))
                            })
                        }
                        
                        if viewModel.tips.isEmpty {
                            
                            VStack(spacing: 6, content: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                                    .padding(.bottom, 20)
                                
                                Text("Empty")
                                    .foregroundColor(.white)
                                    .font(.system(size: 21, weight: .semibold))
                                
                                Text("You don't have any tip right now. Create a first new by click on the +")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 14, weight: .regular))
                                    .multilineTextAlignment(.center)
                            })
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 30)
                            
                        } else {
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(viewModel.tips, id: \.self) { index in
                                    
                                    VStack(alignment: .leading, spacing: 7, content: {
                                        
                                        Text(index.title ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(2)
                                        
                                        Text(index.caption ?? "")
                                            .foregroundColor(.white.opacity(0.6))
                                            .font(.system(size: 13, weight: .regular))
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(4)
                                    })
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            })
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            
            viewModel.fetchTips()
        }
        .sheet(isPresented: $viewModel.isSettings, content: {
            
            SettingsView()
        })
        .overlay (
        
            ZStack {
                
                Color.black.opacity(viewModel.isMenu ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isMenu = false
                        }
                    }
                
                VStack {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray)
                        .frame(width: 90, height: 5)
                    
                    Button(action: {
                        
                        viewModel.isSettings = true
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isMenu = false
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "gear")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("Settings")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .frame(height: 50)
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://docs.google.com/document/d/1OiNJ8vszrhPKL_kSScsu1ii_JJCFdD6XcpViMm1r7xI/edit?usp=sharing") else { return }
                        
                        UIApplication.shared.open(url)
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isMenu = false
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "doc")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .frame(height: 50)
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isMenu = false
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("Rate Us")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .frame(height: 50)
                    })
                }
                .padding([.horizontal, .bottom])
                .padding(.top, 7)
                .frame(maxWidth: .infinity)
                .background(Color.white.ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isMenu ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
