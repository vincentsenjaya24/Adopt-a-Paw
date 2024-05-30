import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var viewModel: PetViewModel
    @Query var petData: [Pet]
    @State private var path = [Pet]()
    @State private var pets: [Pet] = []
    @State private var newPet: Pet?
    @State private var selectedPet: Pet? // State to track the selected pet for editing

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(pets) { pet in
                            PetCard(pet: pet)
                                .contentShape(Rectangle()) // Makes the whole card tappable
                                .onTapGesture {
                                    path.append(pet)
                                }
                                .onLongPressGesture {
                                    selectedPet = pet
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .navigationTitle("Discover")
                    .navigationDestination(for: Pet.self) { pet in
                        RealityView(pet: pet)
                    }
                    .toolbar {
                        ToolbarItem(placement: .automatic) {
                            Button(action: {
                                viewModel.addNewPet()
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(Color(hex: 0xFC6736))
                            }
                        }
                    }
                }
            }
            .background(Color(hex: 0xEFECEC))
            .onAppear {
                pets = petData
            }
            .sheet(item: $selectedPet) { pet in
                EditPetView(pet: pet, onSave: { viewModel.savePet(pet) }) {
                    viewModel.deletePet(pet: pet)
                }
            }
        }
    }

}


