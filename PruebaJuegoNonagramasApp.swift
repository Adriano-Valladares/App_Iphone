//
//  PruebaJuegoNonagramasApp.swift
//  PruebaJuegoNonagramas
//
//  Created by Alumno on 8/09/25.
//

import SwiftUI


enum AppFont {
    case largeTitle
    case headline
    case body
}


private struct AppFontKey: EnvironmentKey {
    static let defaultValue: [AppFont: Font] = [:]
}

extension EnvironmentValues {
    var appFonts: [AppFont: Font] {
        get { self[AppFontKey.self] }
        set { self[AppFontKey.self] = newValue }
    }
}

@main
struct PruebaJuegoNonagramasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.appFonts, [
                    .body: .custom("Quicksand-VariableFont_wght", size: 16),
                    .headline: .custom("ComicRelief-Bold", size: 32),
                    .largeTitle: .custom("NerkoOne-Regular", size: 48)
                ])
        }
    }
}

struct AppFontModifier: ViewModifier {
    @Environment(\.appFonts) var appFonts
    let style: AppFont

    func body(content: Content) -> some View {
        if let font = appFonts[style] {
            
            return content.font(font)
                .eraseToAnyView()
        } else {
            
            return content
                .eraseToAnyView()
        }
    }
}


extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}


struct PillButtonModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 32)
            .padding(.vertical, 12)
            .background(Color("PrimaryColor"))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}


extension View {
    func pillButton() -> some View {
        self.modifier(PillButtonModifier())
    }
}
