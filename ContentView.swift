//
//  ContentView.swift
//  PruebaJuegoNonagramas
//
//  Created by Alumno on 8/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text(NSLocalizedString("bienvenido_juego", comment: "Bienvenido al juego de Nonagramas"))
                    .font(.custom("ComicRelief-Bold", size: 50))
                    .foregroundColor(.black)
                    .padding()

                Spacer()

                VStack {
                    Image("appNonagrama")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)

                    NavigationLink(destination: SeleccionDificultad()) {
                        Text(NSLocalizedString("empezar", comment: "Empezar"))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                            .frame(width: 200, height: 50)
                            .font(.custom("Quicksand-VariableFont_wght", size: 24))
                            
                    }
                    
                    Spacer().frame(height: 16)
                    
                    NavigationLink(destination: ServicioWeb()) {
                        Text(NSLocalizedString("Servicio", comment: "Link directorio web"))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                            .frame(width: 200, height: 50)
                            .font(.custom("Quicksand-VariableFont_wght", size: 24))
                    }
                }

                Spacer()

                Text(NSLocalizedString("derechos", comment: "Derechos reservados"))
                    .font(.custom("ComicRelief-Regular", size: 16))
                    .foregroundColor(.gray)
                    .padding(.bottom)
            }
            .frame(maxWidth: .infinity)
            .background(Color("BackgroundColor"))
        }
    }
}

#Preview {
    ContentView()
}

