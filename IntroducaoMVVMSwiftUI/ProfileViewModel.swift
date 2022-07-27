//
//  ProfileViewModel.swift
//  IntroducaoMVVMSwiftUI
//
//  Created by Renato Yoshinari on 27/07/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var isFollowing = false
    @Published var userFollowers = String()
    
    var user = User(
        picture: "swift",
        name: "Swift",
        nick: "@swift",
        followers: 45952
    )
    
    init(){
        loadFollowers()
    }
    
    func loadFollowers(){
        self.userFollowers = customizeNumber(value: user.followers)
    }
    
    func customizeNumber(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt-BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)K"
    }
    
    func followToogle() {
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.followers += 1) : (self.user.followers -= 1)
        loadFollowers()
    }
}
