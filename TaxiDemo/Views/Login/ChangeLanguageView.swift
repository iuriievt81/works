//
//  ChangeLanguageView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 9/22/24.
//

import SwiftUI

struct ChangeLanguageView: View {
    
    @State var listArr = ["Arabic", "English", "Ukrainian", "Russian", "Czech"]
    @State var selectIndex = 2
    @State var showWelcom = false
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack(alignment: .leading) {
                    Text("Change language")
                        .font(.customfont(.extraBold, fontSize: 25))
                    
                    ForEach(0..<listArr.count, id: \.self) { index in
                        
                        Button {
                            selectIndex = index
                            showWelcom = true
                        } label: {
                            HStack {
                                Text(listArr[index])
                                    .font(.customfont(.regular, fontSize: 16))
                                    .foregroundColor(selectIndex == index ?
                                        Color.secondaryApp : Color.primaryText)
                                
                                Spacer()
                                
                                if(index == selectIndex) {
                                    Image("check_tick")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                }
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40, alignment: .leading)
                        }
                        
                    }
                    
                }
                .foregroundColor(Color.primaryText)
                .padding(.top, .topInsets + 46)
                .padding(.horizontal, 20)
                
            }
            .background( NavigationLink(destination: WelcomView(), isActive: $showWelcom, label: {
                EmptyView()
            }))
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
            .ignoresSafeArea()
        }
    }
            }

struct ChangeLanguageView_Previews: PreviewProvider{
    static var previews: some View{
        
        NavigationView{
            ChangeLanguageView()
        }
        
    }
}

