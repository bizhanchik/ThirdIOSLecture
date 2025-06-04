//
//  CharacterDetailsView.swift
//  ThirdIOSLecture
//
//  Created by Bizhan on 04.06.2025.
//

import SwiftUI

struct CharacterDetailsView: View {
    @Environment(\.dismiss) var dismiss
    var character: Character
    
    var body: some View {
        VStack{
            AsyncImage(url: character.image) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .padding()
                } else {
                    ProgressView()
                        .scaledToFit()
                        .padding()
                }
                
                VStack(alignment: .leading, spacing: 8){
                    Text(character.name)
                        .font(.largeTitle)
                        .bold()
                    HStack{
                        Label(character.species, systemImage: "person.fill")
                        Spacer()
                        Label(character.gender, systemImage: "figure.stand")
                    }
                    .font(.headline)
                    .padding(.vertical,4)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 4){
                        Label("Origin: \(character.origin.name)", systemImage: "globe")
                        Label("Location: \(character.location.name)", systemImage: "mappin.and.ellipse")
                    }
                    .font(.subheadline)
                }
                
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .padding(.horizontal)
            }
            
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.octagon.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.red.opacity(0.8))
                    )
                    .padding(.horizontal)

            }
            
            

            
            
        }
    }
}

#Preview {
    CharacterDetailsView(character: Character(
            id: 1,
            name: "Rick Sanchez",
            species: "Human",
            gender: "Male",
            image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
            location: .init(name: "Citadel of Ricks"),
            origin: .init(name: "Earth (C-137)")
        ))
}
