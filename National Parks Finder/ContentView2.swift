//
//  ContentView.swift
//  National Parks Finder
//
//  Created by Pamela VanLeirsburg on 6/30/26.
//

import SwiftUI

struct ContentView2: View {

    @State private var parks = [Park]()
    @State private var showingAlert = false
    let service = ParkService()

    var body: some View {

        NavigationStack {

            List(parks) { park in

                NavigationLink {
                    ScrollView {
                        VStack {
                            Text(park.fullName)
                                .font(.headline)
                            Text(park.description)
                                .font(.body)
                        }
                    }
                }
            } label: {
                Text(park.fullName)
            }
            .navigationTitle("National Parks")
        }
        .task {
            await getParks()
        }
    }

    func loadParks() async {

        do {
            parks = try await service.fetchParks()
        }
        catch {
            print(error)
        }
    }
    
    func getParks() async {
        let query = "https://developer.nps.gov/api/v1/parks?limit=50&api_key=LqeeSHB9YmYMlijOmtUmTbJNQl9QwlYC2NYzk0p4"
        if let url = URL(string: query) {
            if let (data, _) = try? await URLSession.shared.data(from: url) {
                if let decodedResponse = try? JSONDecoder().decode([Park].self, from: data) {
                    parks = decodedResponse
                    return
                }
            }
        }
        showingAlert = true
    }
}
#Preview{
    ContentView2()
}


