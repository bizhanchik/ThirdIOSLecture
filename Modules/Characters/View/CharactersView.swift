import SwiftUI

struct CharactersView: View {
    @State private var characters: [Character] = []
    @StateObject private var viewModel = CharactersViewModel()

    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                charactersGrid
                .task {
                    do {
                        characters = try await CharacterService().get()
                    } catch {
                        print("Ошибка при загрузке персонажей: \(error)")
                    }
                }
                
                
                VStack {
                    Spacer()
                    
                    HStack(spacing: 16) {
                        Button {
                            viewModel.goToPreviousPage()
                        } label: {
                            Image(systemName: "chevron.left")
                                .padding()
                                .frame(width: 56)
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.blue.opacity(0.7))
                                )
                        }

                        Text("Page \(viewModel.page)")
                            .foregroundColor(.primary)
                            .font(.headline)

                        Button {
                            viewModel.goToNextPage()
                        } label: {
                            Image(systemName: "chevron.right")
                                .padding()
                                .frame(width: 56)
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.orange.opacity(0.7))
                                )
                        }
                    }
                    .frame(height: 56)
                    .padding(.bottom)

                }
                .ignoresSafeArea()
                
            }
        }
    }
}

extension CharactersView{
    var charactersGrid: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(characters) { character in
                    NavigationLink(destination: CharacterDetailsView(character: character)) {
                        VStack{
                            AsyncImage(url: character.image, transaction: Transaction(animation: .easeInOut)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                        .cornerRadius(10)
                                case .failure(_):
                                    Image(systemName: "xmark.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                        .foregroundColor(.red)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            
                            Text(character.name)
                                .font(.headline)
                                .foregroundColor(Color.primary)
                        }
                        
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}


#Preview {
    CharactersView()
}
