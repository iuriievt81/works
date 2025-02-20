//
//  SignInView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 10/4/24.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var countryObj: Country?
    @State private var showCountryPicker = false
    @State private var txtMobile = ""
    @State private var txtPassword = ""
    @State private var showPassword = false
    
    
    
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
                    Text("Sign In")
                        .font(.customfont(.extraBold, fontSize: 25))
                        .padding(.bottom, 30)
                    
                    Text("Mobile")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.placeholder)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    HStack {
                        Button {
                            showCountryPicker = true
                        }label: {
                            if let countryObj = countryObj {
                                Text("\(countryObj.isoCode.getFlag() )")
                                    .font(.customfont(.semiBold, fontSize: 35))
                                Text("+\(countryObj.phoneCode)")
                                    .font(.customfont(.semiBold, fontSize: 16))
                            }
                        }
                        
                        TextField ("Enter Mobile", text: $txtMobile)
                            .font(.customfont(.semiBold, fontSize: 16))
                            .frame(maxWidth: .infinity)
                    }
                    
                    Divider()
                        .padding(.bottom, 15)
                     
                    
                    LineSecureField(title: "Password", placholder: "*****" , txt: $txtPassword, isShowPassword: $showPassword)
                        .padding(.bottom, 15)
                    
                    
                    NavigationLink{
                    }label: {
                        Text("CONTINUE")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                    .background(Color.primaryApp)
                    .cornerRadius(25)
                    .padding(.bottom, 15)
                    
                    Button{
                        
                    }label: {
                        Text("FORGOT PASSWORD")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(Color.secondaryApp)
                    }
                    .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                }
                .foregroundColor(Color.primaryText)
                .padding(.horizontal, 20)
            }
        }
        .onAppear{
            self.countryObj = Country(phoneCode: "420", isoCode: "CZ")
        }
        .sheet(isPresented: $showCountryPicker) {
            CountryPickerUI(country: $countryObj)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
