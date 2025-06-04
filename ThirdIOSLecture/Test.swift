import SwiftUI

struct TileViewExample: View {
    // Пример данных — массив чисел
    let items = Array(1...20)
    
    // Две колонки одинаковой ширины
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(items, id: \.self) { item in
                    Text("Item \(item)")
                        .frame(maxWidth: .infinity, minHeight: 100)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 8)
                }
            }
            .padding()
        }
    }
}

#Preview {
    TileViewExample()
}
