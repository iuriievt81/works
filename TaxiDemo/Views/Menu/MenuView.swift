//
//  MenuView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 1/26/25.
//

import SwiftUI

struct MenuView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 0){
            
            VStack{
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    }label: {
                        Image("close")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image("question_mark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Help")
                            .font(.customfont(.regular, fontSize: 16))
                    })
                    .foregroundColor(.black)
                }
                .padding(.horizontal, 20)
                .padding(.top, .topInsets)
                
                
                
                HStack(alignment: .bottom, spacing: 15,  content: {
                    Button(action: {
                        
                    }, label: {
                        VStack{
                            
                            Image("earnings")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            
                            Text("Earnings")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(.black)
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    Button(action: {
                        
                    }, label: {
                        VStack{
                            
                            ZStack(alignment: .bottom){
                                Image("ride_user_profile")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(50)
                                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.white, lineWidth: 2))
                                    .clipped()
                                
                                HStack(spacing: 8){
                                    Image("rate_portfolio")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                    
                                    Text("4.89")
                                        .font(.customfont(.regular, fontSize: 16))
                                        .foregroundColor(.primaryText)
                                }
                                .padding(.horizontal, 8)
                                .background(Color.white)
                            }
                            
                            
                            Text("James Norinton")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(.black)
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    Button(action: {
                        
                    }, label: {
                        VStack{
                            
                            Image("wallet")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            
                            Text("Wallet")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(.black)
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .center)
                })
                .padding(.bottom, 15)
                
                
            }
            .background(Color(hex: "FEED96"))
            
            ScrollView{
                VStack{
                    HStack{
                        Image("service")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 50)
                        
                        VStack{
                            Text("Switch Service Type")
                                .font(.customfont(.extraBold, fontSize: 18))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Change your service type")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(.secondaryText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image("next")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(Color(hex: "FFF5BF"))
                    
                    
                    HStack{
                        Image("home")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 12)
                        
                        Text("Home")
                            .font(.customfont(.semiBold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    
                    HStack{
                        Image("summury")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 12)
                        
                        Text("Summury")
                            .font(.customfont(.semiBold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    
                    HStack{
                        Image("subscription")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 12)
                        
                        Text("Subscription")
                            .font(.customfont(.semiBold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    
                    HStack{
                        Image("notification")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 12)
                        
                        Text("Notification")
                            .font(.customfont(.semiBold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    
                    HStack{
                        Image("settings")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 12)
                        
                        Text("Settings")
                            .font(.customfont(.semiBold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    
                    HStack{
                        Image("logout")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 12)
                        
                        Text("Log Out")
                            .font(.customfont(.semiBold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    
                    HStack{
                        Image("social")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 12)
                        
                        Text("Social")
                            .font(.customfont(.semiBold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    
                    
                    HStack{
                        Image("deleteaccount")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 12)
                        
                        Text("Delete Account")
                            .font(.customfont(.semiBold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(Color.red.opacity(0.1))
                    
                    
                }
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MenuView()
}
