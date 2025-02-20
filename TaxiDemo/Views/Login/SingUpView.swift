//
//  SingUpView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 10/6/24.
//

import SwiftUI
import CountryPicker

struct SingUpView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var countryObj: Country?
    @State private var showCountryPicker = false
    
    @State private var txtFirst = ""
    @State private var txtLast = ""
    @State private var txtAddress = ""
    
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
                    Text("Create profile")
                        .font(.customfont(.extraBold, fontSize: 25))
                        .padding(.bottom, 30)
                    
                    
                    LineTextField(title: "First Name", placholder: "Ex: Alex" ,txt: $txtFirst)
                        .padding(.bottom, 8)
                    
                    LineTextField(title: "Last Name", placholder: "Ex: Smith" ,txt: $txtLast)
                        .padding(.bottom, 8)
                    
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
                    
                    LineTextField(title: "Address", placholder: "Ex: State, City" ,txt: $txtAddress)
                        .padding(.bottom, 8)
                    
                    
                    LineSecureField(title: "Password", placholder: "*****" , txt: $txtPassword, isShowPassword: $showPassword)
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
                    
                    VStack(alignment: .leading, spacing: 0){
                        NavigationLink{
                            BankDataView()
                        }label: {
                            Text("REGISTER")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(Color.white)
                        }
                        .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                        .background(Color.primaryApp)
                        .cornerRadius(25)
                        .padding(.bottom, 30)
                    }
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SingUpView()
        }
    }
}
