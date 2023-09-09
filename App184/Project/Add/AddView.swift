//
//  AddView.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = AddViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New Tip")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.addPost {
                                
                                router.wrappedValue.dismiss()
                            }
                            
                        }, label: {
                            
                            Text("Share")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        })
                        .opacity(viewModel.title.isEmpty || viewModel.caption.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.title.isEmpty || viewModel.caption.isEmpty ? true : false)
                    }
                }
                .padding()
                .padding(.bottom)
                
                VStack(alignment: .leading, content: {
                    
                    Text("Title")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Type text")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.title.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.title)
                            .foregroundColor(.white)
                            .font(.system(size: 15 ,weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                })
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                VStack(alignment: .leading, content: {
                    
                    Text("Caption")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Type caption")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.caption.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.caption)
                            .foregroundColor(.white)
                            .font(.system(size: 15 ,weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                })
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
