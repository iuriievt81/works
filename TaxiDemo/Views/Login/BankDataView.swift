//
//  BankDataView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 10/6/24.
//

import SwiftUI

struct BankDataView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var txtBankName = ""
    @State private var txtAccountHolderName = ""
    @State private var txtAccountNumber = ""
    @State private var txtSwiftCode = ""
    
    var body: some View{
        ZStack{
            ScrollView{
                HStack(alignment: .center) {
                    Button{
                        mode.wrappedValue.dismiss()
                    }label: {
                        Image("Back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                    }
                    
                    Text("Bank Details")
                        .font(.customfont(.extraBold, fontSize: 25))
                    
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                        .frame(width: 15, height: 15)
                    
                }
                
                .padding(.top, .topInsets + 8)
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    
                    
                    LineTextField(title: "Bank Name", placholder: "Ex: SBI" ,txt: $txtBankName)
                        .padding(.bottom, 8)
                    
                    LineTextField(title: "Account Holder Name ", placholder: "Ex: Alex Smith" ,txt: $txtAccountHolderName)
                        .padding(.bottom, 8)
                    
                    
                    LineTextField(title: "Account Number", placholder: "Ex: A123456789" ,txt: $txtAccountNumber)
                        .padding(.bottom, 8)
                    
                    
                    LineTextField(title: "Swift/IFSC Code", placholder: "000000000" , txt: $txtSwiftCode)
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
                    
                    VStack (alignment: .leading, spacing: 0){
                        NavigationLink{
                            DocumentUploadView()
                        }label: {
                            Text("NEXT")
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
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
            .ignoresSafeArea()
        }
    }
    
    struct BankDataView_Previews: PreviewProvider {
        static var previews: some View {
            BankDataView()
        }
    }

