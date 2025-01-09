//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 09.01.2025.
//

import SwiftUI

struct ErrorView: View {
    @Environment(\.dismiss) private var dismiss
    
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    var wrapper: ErrorWrapper {
        enum SampleError: Error {
            case errorRequired
        }
        
        return ErrorWrapper(
            error: SampleError.errorRequired,
            guidance: "You can safely ignore this error."
        )
    }
    ErrorView(errorWrapper: wrapper)
}
