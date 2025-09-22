//
//  TableroNonogramaView.swift
//  PruebaJuegoNonagramas
//
//  Created by Alumno on 15/09/25.
//

import SwiftUI

enum Herramienta {
    case pintar, tachar
}

enum EstadoCelda {
    case vacia, pintada, tachada
    
    var color: Color {
        switch self {
        case .vacia: return .white
        case .pintada: return .black
        case .tachada: return .red
        }
    }
}

struct TableroNonogramaView: View {
    let gridSize: Int
    let pistasColumnas: [[Int]]
    let pistasFilas: [[Int]]
    let solucion: [[Bool]]
    
    @State private var estados: [[EstadoCelda]]
    @State private var herramientaSeleccionada: Herramienta = .pintar
    
    init(gridSize: Int, pistasColumnas: [[Int]], pistasFilas: [[Int]], solucion: [[Bool]]) {
        self.gridSize = gridSize
        self.pistasColumnas = pistasColumnas
        self.pistasFilas = pistasFilas
        self.solucion = solucion
        _estados = State(initialValue: Array(repeating: Array(repeating: .vacia, count: gridSize), count: gridSize))
    }
    
    var body: some View {
        VStack(spacing: 4) {
            
            HStack(spacing: 0) {
                Spacer().frame(width: 70)
                ForEach(0..<gridSize, id: \.self) { col in
                    VStack {
                        ForEach(pistasColumnas[col], id: \.self) { num in
                            Text("\(num)")
                                .font(.system(size: 12))
                        }
                    }
                    .frame(width: 30, height: 50)
                }
            }
            
          
            ForEach(0..<gridSize, id: \.self) { row in
                HStack(spacing: 0) {
                    
                    HStack {
                        ForEach(pistasFilas[row], id: \.self) { num in
                            Text("\(num)")
                                .font(.system(size: 12))
                        }
                    }
                    .frame(width: 70, height: 30)
                    
                    
                    ForEach(0..<gridSize, id: \.self) { col in
                        Rectangle()
                            .fill(estados[row][col].color)
                            .frame(width: 30, height: 30)
                            .border(Color.gray, width: 0.5)
                            .overlay(
                                bordeCentral(row: row, col: col)
                            )
                            .onTapGesture {
                                aplicarHerramienta(row: row, col: col)
                            }
                    }
                }
            }
            
           
            HStack(spacing: 20) {
                Button {
                    herramientaSeleccionada = .pintar
                } label: {
                    Image(systemName: "square.fill")
                        .foregroundColor(.black)
                        .padding()
                        .background(herramientaSeleccionada == .pintar ? Color.gray.opacity(0.3) : Color.clear)
                        .clipShape(Circle())
                }
                
                Button {
                    herramientaSeleccionada = .tachar
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.red)
                        .padding()
                        .background(herramientaSeleccionada == .tachar ? Color.gray.opacity(0.3) : Color.clear)
                        .clipShape(Circle())
                }
            }
            .padding(.top, 20)
        }
        .padding()
    }
    
    
    @ViewBuilder
    private func bordeCentral(row: Int, col: Int) -> some View {
        ZStack {
            if gridSize == 10 {
                if col == 4 {
                    Rectangle()
                        .frame(width: 3)
                        .foregroundColor(.black)
                        .offset(x: 15)
                }
                if row == 4 {
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(.black)
                        .offset(y: 15)
                }
            }
        }
    }
    
    
    private func aplicarHerramienta(row: Int, col: Int) {
        switch herramientaSeleccionada {
        case .pintar:
            if solucion[row][col] {
                estados[row][col] = .pintada
            } else {
                
                estados[row][col] = .tachada
            }
        case .tachar:
            if solucion[row][col] {
                
                estados[row][col] = .tachada
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    estados[row][col] = .vacia
                }
            } else {
                estados[row][col] = .tachada
            }
        }
    }
}

#Preview {
    TableroNonogramaView(
        gridSize: 10,
        pistasColumnas: [
            [1,6],[1,1,1],[2],[5],[3,1],[4],[1,2],[1,5],[4,2,1],[1,1,2]
        ],
        pistasFilas: [
            [1,1,1,1],[2,2],[1],[4],[10],[3,2,1],[4,2,1],[1,6],[10],[10]
        ],
        solucion: Array(repeating: Array(repeating: false, count: 10), count: 10)
    )
}



