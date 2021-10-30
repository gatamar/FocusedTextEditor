//
//  ContentView.swift
//  FocusedTextEditor
//
//  Created by Olha Pavliuk on 29.10.2021.
//

import SwiftUI

struct ContentView: View {
    private enum Field: Int, Hashable {
        case focused, notFocues
    }
    @State var textToEdit: String = "ababahalamaha"
    @FocusState private var textFocused: Field?
    @State var showEditorInsteadOfLabel: Bool = false
    
    var body: some View {
        VStack {
            
            if showEditorInsteadOfLabel {
                TextEditor(text: $textToEdit)
                    .keyboardType(.alphabet)
                    .frame(minWidth: 10, maxWidth: 200, minHeight: 10, maxHeight: 200, alignment: .topLeading)
                    .background(Color.green)
                    .focused($textFocused, equals: .focused)
            } else {
                Text(textToEdit)
                    .background(Color.yellow)
            }
            
            Button {
                textFocused = .focused // doesn't work - the TextEditor appears, but without the keyboard
                showEditorInsteadOfLabel = true
            } label: {
                Text("show keyboard")
            }
            
            Button {
                textFocused = .focused // only now the keyboard appears
            } label: {
                Text("show keyboard AGAIN")
            }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
