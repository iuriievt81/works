//
//  RunTripView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 11/1/24.
//

import SwiftUI
import MapKit

struct RunTripView: View {
    
    @State var pickupLocation = CLLocationCoordinate2D(latitude: 50.0755, longitude: 14.4384) // Náměstí Míru
    @State var dropLocation = CLLocationCoordinate2D(latitude: 50.1023, longitude: 14.4045) // Korunovační 51
    @State var isOpen = true
    @State var showCancel = false
    @State var showCancelReason = false
    
    var body: some View {
        
        ZStack{
            
            MyMapView(requestLocation: $pickupLocation, destinationLocation: $dropLocation)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                HStack{
                    Spacer()
                    
                    HStack{
                        Image("pickup_pin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        
                        Text("1 Ash Park, Pembroke Dock, SA72, Drury Lane, Oldham, OL9 7Ph")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor(Color.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                    .padding(15)
                    .background(Color.white)
                    .cornerRadius(35)
                    .shadow(radius: 3, y: -1)
                    Spacer()
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 8)
                
                Spacer()
                
                VStack{
                    
                    HStack{
                        Button(action: {
                            withAnimation{
                                isOpen.toggle()
                            }
                        }, label: {
                            Image(!isOpen ? "open btn" : "close btn")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                        })
                        
                        VStack(spacing: 8) {
                            Spacer()
                                .frame(height: 10)
                            
                            HStack{
                                Text("25 min")
                                    .font(.customfont(.bold, fontSize: 25))
                                    .foregroundColor(Color.primaryText)
                                
                                Image("User")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                
                                Text("0.5 min")
                                    .font(.customfont(.bold, fontSize: 25))
                                    .foregroundColor(Color.primaryText)
                            }
                            
                            Text("Picking you James Smith")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(Color.secondaryText)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Button(action: {
                            
                        }, label: {
                            Image("Call")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                        })
                    }
                    .padding(.horizontal, 20)
                    
                    if(isOpen){
                        Divider()
                        
                        HStack (spacing: 0){
                            VStack(spacing: 0){
                                Image("chat")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45)
                                
                                Text("Chat")
                                    .font(.customfont(.regular, fontSize: 18))
                                    .foregroundColor(Color.primaryText)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                            VStack(spacing: 0){
                                Image("message")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45)
                                
                                Text("Message")
                                    .font(.customfont(.regular, fontSize: 18))
                                    .foregroundColor(Color.primaryText)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                            Button {
                                showCancel = true
                            } label: {
                                VStack(spacing: 0){
                                    Image("cancel_trip")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 45)
                                    
                                    Text("Cancel")
                                        .font(.customfont(.regular, fontSize: 18))
                                        .foregroundColor(Color.primaryText)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                            
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    }
                    
                    
                    
                    
                    NavigationLink{
                        
                    } label: {
                        Text("ARRIVED")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                    .background(Color.secondaryApp)
                    .cornerRadius(25)
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, .bottomInsets + 8)
                .background(Color.white)
                .cornerRadius(20, corner: [.topLeft, .topRight])
                .shadow(radius: 3, y: -3)
                
            }
        }
        .fullScreenCover(isPresented: $showCancel, content: {
            ZStack{
                
                VisualEffectView(blurRadius: 15)
                    .ignoresSafeArea()
                    .offset(y: -3)
                
                VStack{
                    
                    Spacer()
                    
                    VStack{
                        Text("Cancel Rickdean's trip?")
                            .font(.customfont(.extraBold, fontSize: 18))
                            .foregroundColor(Color.primaryText)
                            .padding(.top, 15)
                        
                        Divider()
                        
                        Button{
                            self.showCancelReason = true
                            self.showCancel = false
                        } label: {
                            Text("YES, CANCEL")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(Color.white)
                        }
                        .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                        .background(Color.secondaryApp)
                        .cornerRadius(25)
                        .padding(.horizontal, 20)
                        .padding(.top)
                        
                        Button{
                            self.showCancel = false
                        } label: {
                            Text("DON'T CANCEL")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(Color.primaryText)
                        }
                        .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.secondaryText,lineWidth: 1))
                        .cornerRadius(25)
                        .padding(.horizontal, 20)
                        .padding(.bottom, .bottomInsets)
                        
                    }
                    .background(Color.white)
                    .cornerRadius(10, corner: [.topLeft, .topRight])
                    .shadow(radius: 2, y: -3)
                }
            }
            
            .background(BackgroundCleanerView())
        })
        .fullScreenCover(isPresented: $showCancelReason, content: {
            ReasonView()
                .background(Color.white)
                .ignoresSafeArea()
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
        
}


#Preview {
    RunTripView()
}
