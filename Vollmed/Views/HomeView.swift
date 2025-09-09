//
//  HomeView.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 12/09/23.
// Last modify by Thirteena on 03/07/25.

import SwiftUI

struct HomeView: View {
    
    let service = WebService()
    var viewModel = HomeViewModel(service: HomeNetworkingService(),
        authService: AuthenticationService())
    
    @State private var specialists: [Specialist] = []
    @State private var isShowingSnackBar = false
    @State private var isFetchingData = true
    @State private var errorMessage = ""
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Image(.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding(.vertical, 32)
                    Text("Boas-vindas, aumigo!")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color(.lightBlue))
                    //Text("Aqui você pode cuidar melhor do seu amiguinho de quatro patas!")
                        //.font(.title3)
                       // .bold()
                       // .foregroundColor(.accentColor)
                       // .multilineTextAlignment(.center)
                      //  .padding(.vertical, 16)
                    
                    CarouselTabView()
                            .padding(.vertical, 16)
                    
                    Text("Selecione quem vai atender seu amigo:")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 16)
                    
                    if isFetchingData {
                        SkeletonView()
                    } else{
                        
                        ForEach(specialists) { specialist in
                            SpecialistCardView(specialist: specialist)
                                .padding(.bottom, 8)
                        }
                        
                    }
                    
                 
                }
                .padding(.horizontal)
                
                .background(
                    Image("backfundo")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.08)
                        .ignoresSafeArea()
                        )
            }
            .padding(.top)
            .onAppear {
                Task {
                    do {
                        //sleep(3)
                        isFetchingData = false
                        guard let response = try await viewModel.getSpecialists() else { return }
                        self.specialists = response
                    } catch {
                        isShowingSnackBar = true
                        let errorType = error as? RequestError
                        errorMessage = errorType?.customMessage ?? "Ops, tivemos um problema aqui"
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        Task {
                            await viewModel.logout()
                        }
                    }, label: {
                        HStack(spacing: 2) {
                            Image(systemName: "pawprint")
                            Text("Logout")
                        }
                    })
                }
            }
            
            if isShowingSnackBar{
                SnackBarErrorView(isShowing: $isShowingSnackBar, message: errorMessage)
            }
        }
    }
}

#Preview {
    HomeView()
}
