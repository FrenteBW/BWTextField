// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import SwiftUI

@available(iOS 15.0, *)

public struct BWTextField: View {
    let imageName: String
    let placeholderText: String
    let isSecureField: Bool
    @Binding var text: String
    @State private var secretbutton: Bool = false
    @FocusState var inFocus: Field?
    
    enum Field {
        case secure, plain
    }
    
    public var body: some View {
        if isSecureField { //SecureField
            VStack {
                ZStack(alignment: .trailing) {
                    if secretbutton {
                        HStack {
                            Image(systemName: imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(.darkGray))
                                .padding(.horizontal, 10)
                            TextField(placeholderText, text: $text)
                                .focused($inFocus, equals: .plain)
                                .padding(.vertical, 15)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        Button(action: {
                            self.secretbutton.toggle()
                            inFocus = secretbutton ? .plain : .secure
                        })
                        {
                            Image(systemName: self.secretbutton ? "eye" : "eye.slash")
                                .accentColor(.gray)
                                .padding(.trailing, 15)
                        }
                    } else {
                        HStack {
                            Image(systemName: imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(.darkGray))
                                .padding(.horizontal, 10)
                            SecureField(placeholderText, text: $text)
                                .focused($inFocus, equals: .secure)
                                .padding(.vertical, 15)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        Button(action: {
                            self.secretbutton.toggle()
                            inFocus = secretbutton ? .plain : .secure
                        })
                        {
                            Image(systemName: self.secretbutton ? "eye" : "eye.slash")
                                .accentColor(.gray)
                                .padding(.trailing, 15)
                        }
                    }
                }
            }.ignoresSafeArea(.keyboard, edges: .bottom)
        }
        else { //Textfield
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                    .padding(.horizontal, 10)
                TextField(placeholderText, text: $text)
                    .focused($inFocus, equals: .plain)
                    .padding(.vertical, 15)
                }
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1)
                )
        }
    }
}
