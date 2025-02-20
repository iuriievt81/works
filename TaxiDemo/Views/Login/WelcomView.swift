//
//  WelcomView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 9/24/24.
//

import SwiftUI

struct WelcomView: View {
    var body: some View {
        ZStack{
            Image("welcome_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
                .overlay(Rectangle().fill(Color.black.opacity(0.9)))
            
            VStack(alignment: .center, spacing: 15) {
                
                Image("AppIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth * 0.3)
                
                Spacer()
                
                NavigationLink{
//                    MobileNumberView()
                    SignInView()
                }label: {
                    Text("SING IN")
                       .font(.customfont(.regular, fontSize: 16))
                       .foregroundColor(Color.secondaryApp)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 45, alignment: .center)
                .background(Color.primaryApp)
                .cornerRadius(25)
    
                NavigationLink{
                    SingUpView()
                }label: {
                    Text("SING UP")
                        .font(.customfont(.regular,fontSize: 16))
                        .foregroundColor(Color.white)
                }
            }
            .foregroundColor(Color.primaryText)
            .padding(.top, .topInsets + 8)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets + 8)
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

struct WelcomView_Previews: PreviewProvider{
    static var previews: some View {
        NavigationView{
            WelcomView()
        }
    }
}
