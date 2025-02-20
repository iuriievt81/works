//
//  MobileNumberView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 9/26/24.
//

import SwiftUI
import CountryPicker

struct MobileNumberView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var countryObj: Country?
    @State private var showCountryPicker = false
    @State private var txtMobile = ""
    
    
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
                    Text("Enter mobile number")
                        .font(.customfont(.extraBold, fontSize: 25))
                        .padding(.bottom, 30)
                    
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
                    
                    Text("By continuing, I confirm that i have read & agree to the")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundColor(Color.secondaryText)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack{
                        Text("Terms & conditions")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(Color.primaryText)
                        
                        Text("and")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(Color.secondaryText)
                        
                        Text("Privacy policy")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(Color.primaryText)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 15)
                    
                    NavigationLink {
                        OTPView()
                    } label: {
                        Text("CONTINUE")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                    .background(Color.primaryApp)
                    .cornerRadius(25)
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
        struct MobileNumberView_Previews: PreviewProvider {
            static var previews: some View {
                MobileNumberView()
            }
        }

