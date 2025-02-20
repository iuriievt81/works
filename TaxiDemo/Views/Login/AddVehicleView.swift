//
//  AddVehicleView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 10/8/24.
//

import SwiftUI

struct AddVehicleView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var txtServiceType = ""
    @State private var txtBrandName = ""
    @State private var txtModelName = ""
    @State private var txtManufacturer = ""
    @State private var txtNumberPlat = ""
    @State private var txtColor = ""
    
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
                    
                    Text("Add Vehcle")
                        .font(.customfont(.extraBold, fontSize: 25))
                    
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                        .frame(width: 15, height: 15)
                    
                }
                
                .padding(.top, .topInsets + 8)
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    
                    
                    LineTextField(title: "Service Type", placholder: "Ex: Micro" ,txt: $txtServiceType)
                        .padding(.bottom, 8)
                    
                    LineTextField(title: "Brand (Auto Suggestion)", placholder: "Ex: BMW" ,txt: $txtBrandName)
                        .padding(.bottom, 8)
                    
                    
                    LineTextField(title: "Model (Auto Suggestion)", placholder: "Ex: ABC" ,txt: $txtModelName)
                        .padding(.bottom, 8)
                    
                    
                    LineTextField(title: "Manufacturer (Auto Suggestion)", placholder: "BMW" , txt: $txtManufacturer)
                        .padding(.bottom, 15)
                    
                    LineTextField(title: "Number Plat", placholder: "YT123456" , txt: $txtNumberPlat)
                        .padding(.bottom, 15)
                    
                    LineTextField(title: "Color", placholder: "Ex: Red" , txt: $txtColor)
                        .padding(.bottom, 15)
                    

                        NavigationLink{
                            VehicleDocumentView()
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


struct AddVehicleView_Previews: PreviewProvider {
    static var previews: some View {
        AddVehicleView()
    }
}
