//
//  VistaJuego.swift
//  PruebaJuegoNonagramas
//
//  Created by Alumno on 8/09/25.
//

import SwiftUI

struct VistaJuego: View {
    var dificultad: String
    
    var gridSize: Int {
        switch dificultad {
        case "facil":
            return 10
        case "dificil":
            return 15
        default:
            return 10
        }
    }

    var pistasColumnas: [[Int]] {
        switch dificultad {
        case "facil":
            return [
                [0],[1], [1], [6, 1], [8], [6], [4, 1], [2, 1], [2,1], [1]
            ]
        case "dificil":
            return Array(repeating: [1], count: 15)
        default:
            return []
        }
    }

    var pistasFilas: [[Int]] {
        switch dificultad {
        case "facil":
            return [
                [0], [1, 3], [2, 2], [3], [4], [4], [1, 4, 1], [6], [2], [1, 1]
            ]
        case "dificil":
            return Array(repeating: [1, 2], count: 15)
        default:
            return []
        }
    }

    
    var solucion: [[Bool]] {
        switch dificultad {
        case "facil":
            return [
                [false,false,false,false,false,false,false,false,false,false],
                [false,false,false,false,true,false,false,true,true,true],
                [false,false,false,true,true,false,false,true,true,false],
                [false,false,false,true,true,true,false,false,false,false],
                [false,false,false,true,true,true,true,false,false,false],
                [false,false,false,true,true,true,true,false,false,false],
                [false,true,false,true,true,true,true,false,true,false],
                [false,false,true,true,true,true,true,true,false,false],
                [false,false,false,false,true,true,false,false,false,false],
                [false,false,false,true,false,false,true,false,false,false]
            ]
        case "dificil":
            
            return Array(repeating: Array(repeating: false, count: 15), count: 15)
        default:
            return []
        }
    }

    var body: some View {
        VStack {
            Text("Nivel: \(dificultad.capitalized)")
                .font(.custom("NerkoOne-Regular", size: 24))
                .padding()

            TableroNonogramaView(
                gridSize: gridSize,
                pistasColumnas: pistasColumnas,
                pistasFilas: pistasFilas,
                solucion: solucion  
            )

            Spacer()
        }
        .navigationTitle("Juego")
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    VistaJuego(dificultad: "facil")
}

