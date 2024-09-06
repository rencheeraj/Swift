//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Rencheeraj Mohan on 17/08/24.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, backgroundColor: .pink)
                // Login Form
                
                Form {
                    TextField("Email Address",text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Button {
                        // Attemp to login
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("Login")
                                .foregroundStyle(Color.white)
                                .bold()
                        }
                    }
                    .padding()

                }
                
                // Create Account
                VStack {
                    Text("New Around Here")
                    NavigationLink("Create an Account", destination: RegisterView())
                } .padding(.bottom,50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
