//
//  TripDetailsView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 2/11/25.
//

import SwiftUI
import MapKit
struct TripDetailsView: View {
    
    
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    @State var pickupLocation = CLLocationCoordinate2D(latitude: 50.0755, longitude: 14.4384) // Náměstí Míru
    @State var dropLocation = CLLocationCoordinate2D(latitude: 50.1023, longitude: 14.4045) // Korunovační 51
    var body: some View {
        ZStack{
            VStack{
                
                
                ZStack{
                    Text("Trip Details")
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
                            Image("question_mark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            
                            Text("Help")
                                .font(.customfont(.regular, fontSize: 16))
                        })
                        .foregroundColor(.primaryApp)
                    }
                }
                
                .padding(.horizontal, 20)
                .padding(.top, .topInsets)
                
                ScrollView{
                    VStack{
                        
                        Rectangle()
                            .fill(Color.lightGray)
                            .frame(height: 8)
                            .padding(.bottom, 10)
                        
                        HStack (spacing: 15){
                            Rectangle()
                                .fill(Color.secondaryApp)
                                .frame(width: 10, height: 10)
                                .cornerRadius(5)
                            
                            Text("1 Ash Park, Pembroke Dock, SA72")
                                .font(.customfont(.regular, fontSize: 15))
                                .foregroundColor(Color.primaryText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        
                        HStack (spacing: 15){
                            Rectangle()
                                .fill(Color.primaryApp)
                                .frame(width: 10, height: 10)
                            
                            Text("54 Hollybank Rd, Southampton")
                                .font(.customfont(.regular, fontSize: 15))
                                .foregroundColor(Color.primaryText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        
                       MyMapView(requestLocation: $pickupLocation, destinationLocation: $dropLocation, bottomPadding: 15)
                           .frame(height: .screenWidth * 0.5)
                            .padding(.bottom, 8)
                        
                        HStack(alignment: .top,spacing: 8) {
                            Text("$")
                                .font(.customfont(.extraBold, fontSize: 14))
                                .foregroundColor(Color.secondaryApp)
                            Text("154.75")
                                .font(.customfont(.extraBold, fontSize: 25))
                                .foregroundColor(Color.secondaryApp)
                        }
                        
                        Text("Paid by Cash")
                            .font(.customfont(.regular, fontSize: 15))
                            .foregroundColor(Color.primaryText)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.bottom, 10)
                        
                        VStack (spacing: 0){
                            Divider()
                            
                            HStack{
                                TitleSubtitleButton(title: "15 min", subtitle: "Time")
                                
                                Rectangle().fill(Color.lightGray)
                                    .frame(width: 1, height: 80)
                                
                                TitleSubtitleButton(title: "10 min", subtitle: "Distance")
                            }
                            
                            Divider()
                        }
                        .padding(.bottom, 8)
                        
                        TitleSubtitleRow(title: "Data & Time", subtitle: "11 Feb at 10:00am")
                        TitleSubtitleRow(title: "Service Type", subtitle: "Taxi")
                        TitleSubtitleRow(title: "Trip Type", subtitle: "Comfort")
                        
                        Divider()
                            .padding(.horizontal, 20)
                            .padding(.bottom, 8)
                        
                        HStack{
                            Text("Rated")
                                .font(.customfont(.regular, fontSize: 15))
                                .foregroundColor(Color.secondaryText)
                            
                            Text("\"JohnDoe\"")
                                .font(.customfont(.semiBold, fontSize: 15))
                                .foregroundColor(Color.primaryText)
                            
                            Image("ride_user_profile")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                            
                            HStack(spacing: 0) {
                                ForEach(1...5, id: \.self) { i in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(i <= 4 ? Color.secondaryApp : Color.lightGray)
                                }
                            }
                        }
                        .padding(.bottom, 15)
                    }
                    
                    VStack{
                        VStack(spacing: 0){
                            Rectangle()
                                .fill(Color.lightGray)
                                .frame(height: 20)
                            
                            Text("RECEIPT")
                                .font(.customfont(.extraBold, fontSize: 15))
                                .foregroundColor(Color.primaryText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 8)
                                .background(Color.lightGray)
                            
                        }
                        .padding(.bottom, 8)
                        
                        TitleSubtitleRow(title: "Trip fares", subtitle: "$40.25", color: .secondaryText)
                        TitleSubtitleRow(title: "Taxi fee", subtitle: "$20.00", color: .secondaryText)
                        TitleSubtitleRow(title: "+ Tax", subtitle: "$400.00", color: .secondaryText)
                        TitleSubtitleRow(title: "+ Tolls", subtitle: "$400.20", color: .secondaryText)
                        TitleSubtitleRow(title: "Discount", subtitle: "$40.25", color: .secondaryText)
                        TitleSubtitleRow(title: "+ Topup Added", subtitle: "$20.75", color: .secondaryText)
                            .padding(.bottom, 4)
                        
                        Divider()
                        
                        TitleSubtitleRow(title: "Paid", subtitle: "$860.75", color: .secondaryApp, fontWeight: .semiBold)
                            .padding(.bottom, 8)
                        
                        Text("Trip was towards your destination with a Guaranteed Fare")
                            .font(.customfont(.regular, fontSize: 15))
                            .foregroundColor(Color.secondaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                        
                    }
                    .padding(.bottom, .bottomInsets)
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
    TripDetailsView()
}
