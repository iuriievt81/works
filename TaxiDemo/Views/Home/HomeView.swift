//
//  HomeView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 10/11/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.0755, longitude: 14.4378), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @State private var isOpen = false
    
    var body: some View {
        
        ZStack{
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                HStack(spacing: 0) {
                    
                    Spacer()
                        .frame(width: 60, alignment: .center)
                    
                    Spacer()
                    
                    HStack{
                        Text("$")
                            .font(.customfont(.extraBold, fontSize: 14))
                            .foregroundColor(Color.secondaryApp)
                        
                        Text("157.57")
                            .font(.customfont(.extraBold, fontSize: 24))
                            .foregroundColor(Color.secondaryApp)
                    }
                    
                    .frame(width: 140, alignment: .center)
                    .padding(8)
                    .background(Color.white)
                    
                    .cornerRadius(35)
                    .shadow(radius: 3, x:0, y:-1)
                
               
                    Spacer()
                    ZStack (alignment: .bottomLeading){
                        
                        Image("User")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        
                            .overlay( RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 1.5 ))
                            .cornerRadius(20)
                            .clipped()
                        
                        Text("3")
                            .font(.customfont(.regular, fontSize: 10))
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 5)
                            .background(Color.red)
                            .cornerRadius(20)
                            .overlay( RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 1.5 ))
                        
                    }
                    .frame(width: 60, alignment: .center)
                    
                    
                }
                
                .padding(.horizontal, 15)
                .padding(.top, .topInsets + 15)
                
                Spacer()
                
                
                HStack{
                    
                    Spacer()
                        .frame(width:50)
                    
                    Spacer()
                    
                    Button{
                        
                    }label: {
                        ZStack{
                            Text("GO")
                                .font(.customfont(.semiBold, fontSize: 22))
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 60, height: 60, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.white, lineWidth: 1.5))
                        .cornerRadius(60)
                    }
                    .frame(width: 70, height: 70, alignment: .center)
                    .background(Color.primaryApp)
                    .cornerRadius(35)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image("current location")
                            .resizable()
                            .frame(width: 30, height: 30)
                    })
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                
                VStack(){
                    HStack{
                        
                        Button (action: {
                            withAnimation{
                                isOpen.toggle()
                            }
                        }, label: {
                            Image(!isOpen ? "open btn" : "close btn")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                        })
                        
                        Spacer()
                        
                        Text("You're offline")
                            .font(.customfont(.extraBold, fontSize: 18))
                            .foregroundColor(Color.primaryText)
                        Spacer()
                        Spacer()
                            .frame(width: 15)
                    }
                    .padding(.horizontal, 25)
                    .frame(height: 50)
                    .padding(.horizontal, isOpen ? 0 : .bottomInsets)
                    
                    if(isOpen){
                        VStack (spacing: 0){
                            Divider()
                            
                            HStack (spacing: 0){
                                IconTitleSubtitleButton(icon: "acceptance", title: "Acceptance", subtitle: "95.0%")
                                
                                Divider()
                                    .frame(height: 100)
                                IconTitleSubtitleButton(icon: "rate", title: "Rating", subtitle: "4.75")
                                
                                Divider()
                                    .frame(height: 100)
                                Group{
                                    IconTitleSubtitleButton(icon: "canceleation", title: "Cancellation", subtitle: "2.0%")
                                }
                            }
                            Divider()
                                .padding(.bottom, !isOpen ? 0 : .bottomInsets)
                        }
                    }
                    

                }
                .background(Color.white)
                .cornerRadius(20, corner: [.topLeft, .topRight])
                .shadow(radius: 3, x:0, y:-3)
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    HomeView()
}
