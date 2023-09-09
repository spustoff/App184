//
//  CommunityDetail.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI

struct CommunityDetail: View {
    
    @StateObject var viewModel: CommunityViewModel
    
    var body: some View {
        
        let index = viewModel.current_post
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(alignment: .leading) {
                        
                        HStack(content: {
                            
                            Image(index?.author_image ?? "avatar_1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                            
                            VStack(alignment: .leading, spacing: 4, content: {
                                
                                Text(index?.author_name ?? "Michael Joe")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                                Text("Experienced investor")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, weight: .regular))
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text(index?.post_title ?? "gdfhfghgfhgfhgfhgffg")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                                .multilineTextAlignment(.leading)
                            
                            Text(index?.post_text ?? "gfdgdfgfdgdfgfdgfd")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.leading)
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Comments 0")
                                .foregroundColor(.white)
                                .font(.system(size: 15 ,weight: .medium))
                            
                            VStack(spacing: 6, content: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                                
                                Text("Empty")
                                    .foregroundColor(.white)
                                    .font(.system(size: 21, weight: .semibold))
                                
                                Text("No Any comments right now")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 30)
                        })
                        .padding(.vertical, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                }
                .padding(.top)
            }
        }
    }
}

struct CommunityDetail_Previews: PreviewProvider {
    static var previews: some View {
        CommunityDetail(viewModel: CommunityViewModel())
    }
}
