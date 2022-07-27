//
//  ContentView.swift
//  IntroducaoMVVMSwiftUI
//
//  Created by Renato Yoshinari on 27/07/22.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
   
    var body: some View {
        VStack {
            ProfileDataView()
            ActionView()
        }
        .environmentObject(viewModel)
        .animation(.easeOut, value: viewModel.isFollowing)
        
    }
}

struct ProfileDataView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        Image(systemName: viewModel.user.picture)
            .resizable()
            .frame(width: 250, height: 250)
            .padding(.bottom, 10)
        
        Text(viewModel.user.name)
            .font(.system(size: 50, weight: .bold))
        
        Text(viewModel.user.nick)
            .font(.system(size: 23, weight: .regular))
            .foregroundColor(.gray)
        
        Text(viewModel.userFollowers)
            .font(.system(size: 80, weight: .light))
            .padding(viewModel.isFollowing ? 40 : 25)
    }
}

struct ActionView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack{
            Button{ viewModel.followToogle() } label: {
                Label(!viewModel.isFollowing ? "follow" : "unfollow", systemImage: "person.crop.circle.badge.plus")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!viewModel.isFollowing ? .blue : .black)
            
            Button{} label: {
                Label("enviar mensagem", systemImage: "paperplane.fill")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!viewModel.isFollowing)
        }
        .padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
