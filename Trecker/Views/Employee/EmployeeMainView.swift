import SwiftUI
import MapKit

struct EmployeeMainView: View {
    @State private var isOnShift = false
    @State private var buttonScale = 1.0
    @State private var isRotating = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: .constant(MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 55.7558, longitude: 37.6173),
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                )))
                .ignoresSafeArea()
                
                VStack {
                    StatusBar(isOnShift: isOnShift)
                    
                    Spacer()
                    
                    Button(action: toggleShift) {
                        Circle()
                            .fill(isOnShift ? .red : .green)
                            .frame(width: 80, height: 80)
                            .overlay(
                                Text(isOnShift ? "STOP" : "START")
                                    .font(.title2.bold())
                                    .foregroundColor(.white)
                            )
                            .shadow(radius: 10)
                            .scaleEffect(buttonScale)
                    }
                    .padding(.bottom, 30)
                }
            }
            .navigationTitle("Employee Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func toggleShift() {
        withAnimation {
            isOnShift.toggle()
            buttonScale = 0.8
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                buttonScale = 1.0
            }
        }
    }
}

struct StatusBar: View {
    let isOnShift: Bool
    
    var body: some View {
        HStack {
            Image(systemName: isOnShift ? "clock.fill" : "clock")
            Text(isOnShift ? "On Shift" : "Off Shift")
                .fontWeight(.medium)
        }
        .padding(10)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .padding(.top)
    }
}

#Preview {
    EmployeeMainView()
} 