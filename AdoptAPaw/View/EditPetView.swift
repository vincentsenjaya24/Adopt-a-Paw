//
//  EditPetView.swift
//  SwiftDataLearn
//
//  Created by Vincent Senjaya on 23/05/24.
//

import SwiftUI

struct EditPetView: View {
    @Bindable var pet: Pet
    var onSave: () -> Void
    var onDelete: () -> Void
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $pet.name)
                    .textContentType(.name)

                TextField("Pet Breed", text: $pet.modelName)
                    .textContentType(.name)
                    .textInputAutocapitalization(.never)
                
            }

            Section("Notes") {
                TextField("Details about this person", text: $pet.details, axis: .vertical)
            }
            
            Section {
                Button(action: onSave) {
                    Label("Save Pet", systemImage: "checkmark")
                }
                Button(role: .destructive, action: onDelete) {
                    Label("Delete Pet", systemImage: "trash")
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Edit Pet")
    }
    
}
