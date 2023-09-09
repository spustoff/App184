//
//  IdeasView.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI

struct IdeasView: View {
    
    @StateObject var viewModel = IdeasViewModel()
    
    var body: some View {
        
        ZStack {
            
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        NavigationLink(destination: {
                            
                            ProfileView()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image("ava")
                        })
                        
                        Spacer()
                    }
                    
                    Text("Ideas")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Ready-made Strategy")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(viewModel.ideas) { index in
                                    
                                    VStack(alignment: .leading, content: {
                                        
                                        Text(index.title)
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        Text(index.subtitle)
                                            .foregroundColor(.white.opacity(0.5))
                                            .font(.system(size: 14, weight: .regular))
                                            .padding(.bottom, 9)
                                        
                                        Image(index.image)
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                }
                            })
                        })
                        
                        Button(action: {
                            
                            viewModel.isSimulator = true
                            
                        }, label: {
                            
                            Text("Trade on the Simulator")
                                .foregroundColor(.black)
                                .font(.system(size: 14 ,weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Strategy Video")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(viewModel.lessons, id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedLesson = index
                                            viewModel.isDetail = true
                                            
                                        }, label: {
                                            
                                            VStack(alignment: .leading) {
                                                
                                                WebPic(urlString: index.image ?? "", width: 250, height: 160, cornerRadius: 10, isPlaceholder: true)
                                                
                                                Text(index.title ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .medium))
                                                    .multilineTextAlignment(.leading)
                                                    .lineLimit(1)
                                                    .frame(width: 250, alignment: .leading)
                                                
                                                Text("September 2023")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                    .multilineTextAlignment(.leading)
                                                    .lineLimit(1)
                                            }
                                        })
                                    }
                                }
                            }
                            .onAppear {
                                
                                viewModel.getCategories()
                            }
                        })
                        .padding(.top, 30)
                    }
                    .padding()
                }
            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            VideoDetail(index: viewModel.selectedLesson)
        })
        .sheet(isPresented: $viewModel.isSimulator, content: {
            
            IdeasSimulator()
        })
    }
}

struct IdeasView_Previews: PreviewProvider {
    static var previews: some View {
        IdeasView()
    }
}
