//
//  ContentView.swift
//  Trecker
//
//  Created by Vanya  on 14.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showEmployeeView = false
    @State private var showEmployerView = false
    @State private var email = ""
    @State private var password = ""
    @State private var showError = false
    
    // Demo credentials
    private let employerCredentials = (email: "admin@demo.com", password: "admin123")
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Logo
                    Image(systemName: "location.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                    
                    Text("Trecker")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                    
                    // Login fields
                    VStack(spacing: 15) {
                        CustomTextField(text: $email, placeholder: "Email", imageName: "envelope")
                        CustomTextField(text: $password, placeholder: "Password", imageName: "lock", isSecure: true)
                    }
                    .padding(.horizontal, 20)
                    
                    VStack(spacing: 20) {
                        // Employee button
                        Button(action: { showEmployeeView = true }) {
                            AuthButton(title: "Employee Login", backgroundColor: .white)
                        }
                        .fullScreenCover(isPresented: $showEmployeeView) {
                            EmployeeMainView()
                        }
                        
                        // Employer button
                        Button(action: checkEmployerCredentials) {
                            AuthButton(title: "Employer Login", backgroundColor: .white.opacity(0.9))
                        }
                        .fullScreenCover(isPresented: $showEmployerView) {
                            EmployerMainView()
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .alert("Invalid Credentials", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("For employer demo use:\nEmail: admin@demo.com\nPassword: admin123")
        }
    }
    
    private func checkEmployerCredentials() {
        if email == employerCredentials.email && password == employerCredentials.password {
            showEmployerView = true
        } else {
            showError = true
        }
    }
}

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: String
    let imageName: String
    var isSecure: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.gray)
                .frame(width: 20)
            
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.2), radius: 5)
    }
}

struct AuthButton: View {
    let title: String
    let backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(backgroundColor)
            .cornerRadius(25)
            .shadow(radius: 10)
    }
}

#Preview {
    ContentView()
}
