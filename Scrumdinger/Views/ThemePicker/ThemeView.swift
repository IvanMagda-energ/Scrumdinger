//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 08.12.2024.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    var body: some View {
        Text("\(theme.name)")
            .padding(4)
            .frame(maxWidth: .infinity)
            .foregroundStyle(theme.accentColor)
            .background(theme.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
