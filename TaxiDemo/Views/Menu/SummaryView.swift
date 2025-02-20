//
//  SummaryView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 2/12/25.
//

import SwiftUI

struct SummaryView: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    
    @State var isToday = false
    @State var todayArr = [
    [
        "time": "3:32",
        "am_pm": "AM",
        "name": "Pembroke Dock",
        "detail": "Paid by card",
        "price": "$25"
    ],
    [
        "time": "4:32",
        "am_pm": "AM",
        "name": "Location name only",
        "detail": "Paid by card",
        "price": "$35"
    ],
    [
        "time": "5:32",
        "am_pm": "AM",
        "name": "Pembroke Dock",
        "detail": "Paid by card",
        "price": "$30"
    ],
    [
        "time": "6:32",
        "am_pm": "AM",
        "name": "Pembroke Dock",
        "detail": "Paid by card",
        "price": "$40"
    ]
]
    @State var weeklyArr = [
        ["time": "Mon, 10 Feb", "trips": "25", "price": "$40"],
        ["time": "Sun, 9 Feb", "trips": "15", "price": "$30"],
        ["time": "Sut, 8 Feb", "trips": "40", "price": "$120"],
        ["time": "Fri, 7 Feb", "trips": "30", "price": "$100"]
    ]
    
    var body: some View {
        ZStack{
            VStack{
                
                
                ZStack{
                    Text("Summary")
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
                        
                        Button(action: {
                            
                        }, label: {
                            
                            Text("Normal")
                                .font(.customfont(.regular, fontSize: 16))
                        })
                        .foregroundColor(.secondaryApp)
                    }
                }
                
                .padding(.horizontal, 20)
                .padding(.top, .topInsets)
                
                
                VStack(spacing: 0) {
                    VStack(alignment: isToday ? .leading : .trailing){
                        HStack{
                            Button(action: {
                                withAnimation{
                                    isToday = true
                                }
                                
                            },label: {
                                Text("TODAY")
                                    .font(.customfont(.extraBold, fontSize: 16))
                                    .foregroundColor(isToday ? .secondaryApp : .lightGray)
                            })
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            
                            Button(action: {
                                withAnimation{
                                    isToday = false
                                }
                                
                            },label: {
                                Text("WEEKLY")
                                    .font(.customfont(.extraBold, fontSize: 16))
                                    .foregroundColor(!isToday ? .secondaryApp : .lightGray)
                            })
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                    }
                        .frame(height: 40)
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.primaryApp)
                            .frame(width: (.screenWidth * 0.5) - 25, height: 4)
                        
                }
                    .padding(.horizontal, 20)
                    Rectangle()
                        .fill(Color.lightGray)
                        .frame(height: 8)
                        .padding(.bottom, 10)
                        
                }
               
                
                ScrollView{
                    VStack{
                  
                        Text("Wed, 12 FEB'25")
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
                        
                        if(!isToday){
                            HStack{
                                VStack{
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .fill(Color.primaryApp)
                                        .frame(width: 40, height: 120)
                                        .cornerRadius(10, corner: [.topLeft, .topRight])
                                    Text("M")
                                        .font(.customfont(.regular, fontSize: 16))
                                        .foregroundColor(Color.secondaryText)
                                }
                                
                                VStack{
                                    
                                    Spacer()
                                    Rectangle()
                                        .fill(Color.primaryApp)
                                        .frame(width: 40, height: 80)
                                        .cornerRadius(10, corner: [.topLeft, .topRight])
                                    Text("T")
                                        .font(.customfont(.regular, fontSize: 16))
                                        .foregroundColor(Color.secondaryText)
                                }
                                
                                VStack{
                                    
                                    Spacer()
                                    Rectangle()
                                        .fill(Color.primaryApp)
                                        .frame(width: 40, height: 60)
                                        .cornerRadius(10, corner: [.topLeft, .topRight])
                                    Text("W")
                                        .font(.customfont(.regular, fontSize: 16))
                                        .foregroundColor(Color.secondaryText)
                                }
                                
                                VStack{
                                    
                                    Spacer()
                                    Rectangle()
                                        .fill(Color.primaryApp)
                                        .frame(width: 40, height: 90)
                                        .cornerRadius(10, corner: [.topLeft, .topRight])
                                    Text("T")
                                        .font(.customfont(.regular, fontSize: 16))
                                        .foregroundColor(Color.secondaryText)
                                }
                                
                                VStack{
                                    
                                    Spacer()
                                    Rectangle()
                                        .fill(Color.primaryApp)
                                        .frame(width: 40, height: 100)
                                        .cornerRadius(10, corner: [.topLeft, .topRight])
                                    Text("F")
                                        .font(.customfont(.regular, fontSize: 16))
                                        .foregroundColor(Color.secondaryText)
                                }
                                
                                VStack{
                                    
                                    Spacer()
                                    Rectangle()
                                        .fill(Color.primaryApp)
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(10, corner: [.topLeft, .topRight])
                                    Text("S")
                                        .font(.customfont(.regular, fontSize: 16))
                                        .foregroundColor(Color.secondaryText)
                                }
                                
                                VStack{
                                    
                                    Spacer()
                                    Rectangle()
                                        .fill(Color.primaryApp)
                                        .frame(width: 40, height: 120)
                                        .cornerRadius(10, corner: [.topLeft, .topRight])
                                    Text("S")
                                        .font(.customfont(.regular, fontSize: 16))
                                        .foregroundColor(Color.secondaryText)
                                }
                            }
                            .frame(width: .infinity, height: .screenWidth * 0.4, alignment: .bottom)
                        }
                        
                        
                        VStack (spacing: 0){
                            Divider()
                            
                            HStack{
                                TitleSubtitleButton(title: "15", subtitle: "Trips")
                                
                                Rectangle().fill(Color.lightGray)
                                    .frame(width: 1, height: 80)
                                
                                TitleSubtitleButton(title: "8:30", subtitle: "Online hours")
                                
                                
                                Rectangle().fill(Color.lightGray)
                                    .frame(width: 1, height: 80)
                                
                                TitleSubtitleButton(title: "$22.48", subtitle: "Tips")
                            }
                            
                            Divider()
                            VStack(spacing: 0){
                                Rectangle()
                                    .fill(Color.lightGray)
                                    .frame(height: 20)
                                
                                Text("TRIPS")
                                    .font(.customfont(.extraBold, fontSize: 15))
                                    .foregroundColor(Color.primaryText)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 8)
                                    .background(Color.lightGray)
                                
                            }
                            .padding(.bottom, 8)
                        }
                        
                    }
                    
                    LazyVStack{
                        if(isToday){
                            ForEach(0..<todayArr.count, id: \.self, content: { index in
                                TodaySummaryRow(sObj: todayArr[index] as NSDictionary ?? [:] )
                            })
                        }else{
                            ForEach(0..<weeklyArr.count, id: \.self, content: { index in
                                WeeklySummaryRow(sObj: weeklyArr[index] as NSDictionary ?? [:] )
                            })
                        }
                 
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
    SummaryView()
}
