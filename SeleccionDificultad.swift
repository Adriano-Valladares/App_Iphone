//
//  SeleccionDificultad.swift
//  PruebaJuegoNonagramas
//
//  Created by Alumno on 8/09/25.
//

import SwiftUI

struct SeleccionDificultad: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                
                Text(NSLocalizedString("facil_desc", comment: "Descripción Nonagrama fácil"))
                    .font(.custom("NerkoOne-Regular", size: 48))
                    .foregroundColor(.black)
                    .padding()
                
                VStack {
                    Image("facilicono")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding()

                    Text(NSLocalizedString("facil", comment: "Nonagrama Fácil"))
                        .font(.custom("Quicksand-VariableFont_wght", size: 32))
                        .padding(.bottom, AppDimensions.padding_small)

                    NavigationLink(destination: VistaJuego(dificultad: "facil")) {
                        Text(NSLocalizedString("elegir", comment: "Elegir"))
                            .pillButton()
                    }
                }
                Spacer()

                VStack {
                    Image("dificilicono")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding()

                    Text(NSLocalizedString("dificil", comment: "Nonagrama Difícil"))
                        .font(.custom("Quicksand-VariableFont_wght", size: 32))
                        .padding(.bottom, AppDimensions.padding_small)

                    NavigationLink(destination: VistaJuego(dificultad: "dificil")) {
                        Text(NSLocalizedString("elegir", comment: "Elegir"))
                            .pillButton()
                    }
                }

                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    SeleccionDificultad()
}
