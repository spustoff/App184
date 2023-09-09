//
//  IdeasSimulator.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI

struct IdeasSimulator: View {
    
    @State var pairs: [String] = ["EURUSD", "EURTRY", "EURKZT", "EURRUB", "EURJPY"]
    @State var current_pair: String = "EURUSD"
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Menu {
                        
                        ForEach(pairs, id: \.self) { index in
                            
                            Button(action: {
                                
                                current_pair = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                    
                                    Spacer()
                                    
                                    if current_pair == index {
                                        
                                        Image(systemName: "xmark")
                                    }
                                }
                            })
                        }
                        
                    } label: {
                        
                        HStack {
                            
                            Text(current_pair)
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(.blue)
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                    
                    HStack {
                        
                        Spacer()
                        
                        Text("$\(10000)")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                    }
                }
                .padding([.top, .horizontal])
                .padding(.top)
                
                TradeChart(pair: current_pair)
                    .disabled(true)
                
                VStack {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("Invest")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .medium))
                            
                            HStack {
                                
                                Text("$\(100)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 14, weight: .medium))
                            }
                        })
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("Time")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .medium))
                            
                            HStack {
                                
                                Text("00:05:00")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 14, weight: .medium))
                            }
                        })
                    }
                    .padding(.horizontal)
                    .padding(.horizontal, 10)
                    
                    HStack {
                        
                        Text("Up")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                        
                        Text("Down")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                .padding(.horizontal)
                .overlay (
                
                    VStack(spacing: 6, content: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        
                        Text("Not Available")
                            .foregroundColor(.white)
                            .font(.system(size: 21, weight: .semibold))
                        
                        Text("Bidding starts in 6 hours")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.vertical)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.black.opacity(0.7)))
                    .padding()
                )
            }
        }
    }
}

struct IdeasSimulator_Previews: PreviewProvider {
    static var previews: some View {
        IdeasSimulator()
    }
}
