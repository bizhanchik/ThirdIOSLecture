//
//  PageButton.swift
//  ThirdIOSLecture
//
//  Created by Bizhan on 04.06.2025.
//

import SwiftUI

struct PageButton: View {
    @ObservedObject var service: CharacterService
    let imageName: String
    let direction: String
    
    var body: some View {
        Button {
            switch direction {
                case "left":
                print(service.page-=1)
            case "right":
                print(service.page+=1)
            default:
                break
            }
        } label: {
            Image(systemName: imageName + direction)
                .padding()
                .frame(width: 56)
                .foregroundColor(.accentColor)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .circular)
                        .fill(
                            .gray.opacity(0.2)
                        )
                )
            
        }
    }
}

#Preview {
    PageButton(service: CharacterService(), imageName: "chevron.", direction: "right")
}
