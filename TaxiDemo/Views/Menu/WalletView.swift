//
//  WalletView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 2/13/25.
//

import SwiftUI

struct WalletView: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @State var listArr = [
        [
          "icon": "wallet_add",
          "name": "Added to Wallet",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "trips_cut",
          "name": "Trip Deducted",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "withdraw",
          "name": "Withdraw to Wallet",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
            [
          "icon": "wallet_add",
          "name": "Added to Wallet",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "trips_cut",
          "name": "Trip Deducted",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "withdraw",
          "name": "Withdraw to Wallet",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "wallet_add",
          "name": "Added to Wallet",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "trips_cut",
          "name": "Trip Deducted",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ],
        [
          "icon": "withdraw",
          "name": "Withdraw to Wallet",
          "time": "1 Feb'19 • #123467",
          "price": "$40"
        ]
    ]
    var body: some View {
        ZStack{
            VStack{
                
                
                ZStack{
                    Text("Wallet")
                        .font(.customfont(.extraBold, fontSize: 25))
                    
                    HStack{
                        Button{
                            mode.wrappedValue.dismiss()
                        }label: {
                            Image("Back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                        }
                        .foregroundColor(.white)
                        
                        Spacer()
                        
                        
                    }
                }
                
                .padding(.horizontal, 20)
                .padding(.top, .topInsets)
                
               
                
                ScrollView{
                    VStack{
                  
                        Text("Total balance")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor(Color.secondaryText)
                            .padding(.top, 25)
                        
                        HStack(alignment: .top,spacing: 8) {
                            Text("$")
                                .font(.customfont(.extraBold, fontSize: 14))
                                .foregroundColor(Color.secondaryApp)
                            Text("154.75")
                                .font(.customfont(.extraBold, fontSize: 25))
                                .foregroundColor(Color.primaryText)
                        }
                        .padding(.bottom, 25)
                        
                        
                    }
                    
                    LazyVStack{
                        ForEach(0..<listArr.count, id: \.self, content: { index in
//                            TodaySummaryRow(sObj: listArr[index] as NSDictionary ?? [:] )
                        })
                 
                    }
                    .padding(.horizontal, 20)
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
    WalletView()
}
