//
//  MyAppointmentsView.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 18/09/23.
// LastModify by Thirteena on 14/07/2025.

import SwiftUI

struct MyAppointmentsView: View {
    
    let service = WebService()
    var authManager = AuthenticationManager.shared
    
    @State private var appointments: [Appointment] = []
    
    func getAllAppointments() async {
        guard let patientID = authManager.patientID else {
            return
        }
        do {
            if let appointments = try await service.getAllAppointmentsFromPatient(patientID: patientID) {
                self.appointments = appointments
            }
        } catch {
            print("Ocorreu um erro ao obter consultas: \(error)")
        }
    }
    
    var body: some View {
        ZStack {
           
            Color.green.opacity(0.15)
                .ignoresSafeArea()
            
            VStack {
                if appointments.isEmpty {
                    Text("Não há nenhuma consulta agendada no momento!")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(Color.cancel)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(appointments) { appointment in
                            SpecialistCardView(specialist: appointment.specialist,
                                               appointment: appointment)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Minhas consultas")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            Task {
                await getAllAppointments()
            }
        }
    }
}

#Preview {
    MyAppointmentsView()
}
