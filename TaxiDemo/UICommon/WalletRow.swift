//
//  WalletRow.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 2/13/25.
//

import SwiftUI

struct WalletRow: View {
    @State var wObj: NSDictionary = [:]
    var body: some View {
        
        VStack{
            HStack (spacing:15){
                
                VStack (alignment: .leading, spacing:8){
                    Text(wObj.value(forKey: "name") as? String ?? "")
                        .font(.customfont(.regular, fontSize: 16))
                        .foregroundColor(Color.primaryText)
                    
                    Text(wObj.value(forKey: "detail") as? String ?? "")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(Color.secondaryText)
                }
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                
                Text(wObj.value(forKey: "price") as? String ?? "")
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(Color.primaryText)
            }
            Divider()
        }
    }
}

#Preview {
    WalletRow(wObj: [
        "icon": "wallet_add",
        "name": "Added to Wallet",
        "time": "1 Feb'19 • #123467",
        "price": "$40"
      ])
}
