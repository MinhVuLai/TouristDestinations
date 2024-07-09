//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by Minh Vu Lai on 7/8/24.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var viewModel: LocationViewModel
    
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 70)
        )
        .clipShape(.rect(cornerRadius: 10))
    }
}


extension LocationPreviewView {
    
    private var imageSection : some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
        .padding(6 )
        .background(Color("ReversePrimary"))
        .clipShape(.rect(cornerRadius: 10))
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            viewModel.sheetLocation = location
        } label: {
            Text("Learn more")
                .foregroundStyle(Color.primary)
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            viewModel.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    LocationPreviewView(location: LocationsDataService.testLocation)
        .environmentObject(LocationViewModel())
}
