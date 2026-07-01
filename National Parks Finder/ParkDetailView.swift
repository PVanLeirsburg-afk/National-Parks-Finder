//
//  ParkDetailView.swift
//  National Parks Finder
//
//  Created by Pamela VanLeirsburg on 6/30/26.
//

import SwiftUI

struct ParkDetailView: View {

    let park: Park

    var body: some View {

        VStack(spacing: 20) {

            Text(park.fullName)
                .font(.title)
                .bold()

            Text("Latitude: \(park.latitude)")

            Text("Longitude: \(park.longitude)")
        }
        .padding()
        .navigationTitle("Location")
    }
}
