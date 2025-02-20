import SwiftUI
import MapKit

struct EmployerMainView: View {
    @State private var selectedTab = 0
    @Environment(\.dismiss) var dismiss
    
    // Demo data
    let employees = [
        User(id: "1", email: "john@demo.com", firstName: "John", lastName: "Smith", phoneNumber: "+1 234 567 89 00", userType: .employee, isOnShift: true),
        User(id: "2", email: "jane@demo.com", firstName: "Jane", lastName: "Doe", phoneNumber: "+1 234 567 89 01", userType: .employee, isOnShift: false),
        User(id: "3", email: "bob@demo.com", firstName: "Bob", lastName: "Wilson", phoneNumber: "+1 234 567 89 02", userType: .employee, isOnShift: true)
    ]
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                // Map View
                ZStack {
                    Map(coordinateRegion: .constant(MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 55.7558, longitude: 37.6173),
                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    )))
                    .ignoresSafeArea()
                    
                    VStack {
                        Text("Active employees: \(activeEmployeesCount)")
                            .font(.headline)
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                            .padding(.top)
                        
                        Spacer()
                    }
                }
                .tabItem {
                    Label("Map", systemImage: "map")
                }
                .tag(0)
                
                // Employees List
                List(employees) { employee in
                    EmployeeRow(employee: employee)
                }
                .tabItem {
                    Label("Employees", systemImage: "person.2")
                }
                .tag(1)
            }
            .navigationTitle("Employer Dashboard")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private var activeEmployeesCount: Int {
        employees.filter { $0.isOnShift }.count
    }
}

struct EmployeeRow: View {
    let employee: User
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(employee.firstName) \(employee.lastName)")
                    .font(.headline)
                Text(employee.phoneNumber)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Circle()
                .fill(employee.isOnShift ? Color.green : Color.red)
                .frame(width: 12, height: 12)
        }
    }
}

#Preview {
    EmployerMainView()
} 