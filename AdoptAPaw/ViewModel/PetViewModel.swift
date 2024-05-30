//
//  PetViewModel.swift
//  PetDopt
//
//  Created by Vincent Senjaya on 26/05/24.
//

import SwiftUI
import SwiftData

class PetViewModel: ObservableObject {
    @Environment(\.modelContext) private var modelContext
    @Published var pets: [Pet] = []
    @Published var selectedPet: Pet?
    @Published var newPet: Pet?


    func loadPets(from petData: [Pet]) {
        self.pets = petData
    }

    func savePet(_ pet: Pet) {
        if !pets.contains(where: { $0.id == pet.id }) {
            modelContext.insert(pet)
            pets.append(pet)
        }
        selectedPet = nil
        newPet = nil
    }

    func deletePet(pet: Pet) {
        if let index = pets.firstIndex(where: { $0.id == pet.id }) {
            modelContext.delete(pet)
            pets.remove(at: index)
            if selectedPet?.id == pet.id {
                selectedPet = nil
            }
        }
    }

    func addNewPet() {
        let pet = Pet(name: "", emailAddress: "", details: "", modelName: "")
        newPet = pet
        selectedPet = pet
    }
}
