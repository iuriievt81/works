//
//  OPTView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 10/4/24.
//

import SwiftUI

struct OTPView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var txtOTP = ""
    
    var body: some View{
        ZStack{
            ScrollView{
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    }label: {
                        Image("Back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                    }
                    
                    Spacer()
                    
                }
                
                .padding(.top, .topInsets + 8)
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("OTP Verification")
                        .font(.customfont(.extraBold, fontSize: 25))
                        .padding(.bottom, 15)
                    
                    Text("Enter the 4-digit code sent to you at")
                        .font(.customfont(.regular, fontSize: 16))
                        .foregroundColor(Color.secondaryText)
                        .padding(.bottom, 1)
                    
                    HStack{
                        Text("+420 731300499")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor(Color.primaryText)
                            .padding(.bottom, 1)
                        
                        Button{
                            mode.wrappedValue.dismiss()
                        }label: {
                            Text("Edit")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(Color.secondaryApp)
                        }
                    }
                    .padding(.bottom, 30)
                    
                    OTPTextField(txtOTP: $txtOTP)
                        .padding(.bottom, 30)
                    
                    NavigationLink{
                    }label: {
                        Text("SUMBIT")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                    .background(Color.primaryApp)
                    .cornerRadius(25)
                    
                    
                    Button{
                        
                    }label: {
                        Text("Resend Code")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(Color.secondaryApp)
                    }
                    .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                    
                }
                .foregroundColor(Color.primaryText)
                .padding(.horizontal, 20)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}


struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
