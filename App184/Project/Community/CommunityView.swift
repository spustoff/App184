//
//  CommunityView.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI

struct CommunityView: View {
    
    @StateObject var viewModel = CommunityViewModel()
    
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
                    
                    Text("Community")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                }
                .padding()
                
                TabView(content: {
                    
                    ForEach(viewModel.posts) { index in
                        
                        Button(action: {}, label: {
                            
                            VStack(alignment: .leading, content: {
                                
                                HStack(content: {
                                    
                                    Image(index.author_image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                    
                                    VStack(alignment: .leading, spacing: 4, content: {
                                        
                                        Text(index.author_name)
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .medium))
                                        
                                        Text("Experienced investor")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12, weight: .regular))
                                    })
                                })
                                
                                Text(index.post_title)
                                    .foregroundColor(.white)
                                    .font(.system(size: 21, weight: .semibold))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                                
                                Text("September 2023")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .padding(.vertical, 5)
                                
                                Text(index.post_text)
                                    .foregroundColor(.white.opacity(0.8))
                                    .font(.system(size: 14, weight: .regular))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(4)
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    viewModel.current_post = index
                                    viewModel.isDetail = true
                                    
                                }, label: {
                                    
                                    Text("Read Post")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14 ,weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                                })
                            })
                            .padding()
                            .frame(height: UIScreen.main.bounds.height / 2.2, alignment: .top)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                            .padding(.horizontal)
                        })
                    }
                })
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: UIScreen.main.bounds.height / 2.2)
                
                Spacer()
            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            CommunityDetail(viewModel: viewModel)
        })
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
