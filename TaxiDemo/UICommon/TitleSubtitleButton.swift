//
//  TitleSubtitleButton.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 2/11/25.
//

import SwiftUI

struct TitleSubtitleButton: View {
    var title: String = "Title"
    var subtitle: String = "Subtitle"
    
    var body: some View {
        VStack{
            Text(title)
                .font(.customfont(.extraBold, fontSize: 18))
                .foregroundColor(Color.primaryText)
            
            Text(subtitle)
                .font(.customfont(.regular, fontSize: 16))
                .foregroundColor(Color.secondaryText)
        }
        .frame(maxWidth: .infinity,
               alignment: .center)
    }
}

#Preview {
    TitleSubtitleButton()
}
