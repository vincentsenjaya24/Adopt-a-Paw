import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct PetCard: View {
    let pet: Pet
    var body: some View {
        VStack() {
            Image(pet.modelName)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .cornerRadius(0, corners: [.bottomLeft, .bottomRight])
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(pet.name)
                        .font(.headline).foregroundColor(Color(hex: 0x0C2D57))
                    Spacer()
                }
                Text(pet.modelName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(pet.details)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1) // Ensure the text is limited to 1 line
                    .truncationMode(.tail) // Show an ellipsis if the text is too long
            }
            .padding(12.0)
        }
        .background(Color(.white))
        .frame(width: .infinity, height: .infinity, alignment: .center)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.2), radius: 4)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
