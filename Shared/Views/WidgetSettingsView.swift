//
//  WidgetSettingsView.swift
//  WidgetSettingsView
//
//  Created by Ben Cardy on 30/08/2021.
//

import UIKit
import SwiftUI

struct WidgetSettingsView: View {
    
    @AppStorage(UserDefaults.inAppShowMilestonesKey, store: UserDefaults.shared)
    private var showMilestones: Bool = true
    @AppStorage(UserDefaults.inAppShowFullCurrencySymbolKey, store: UserDefaults.shared)
    private var showFullCurrencySymbol: Bool = false
    @AppStorage(UserDefaults.inAppShowGoalPercentageKey, store: UserDefaults.shared)
    private var showGoalPercentage: Bool = true
    @AppStorage(UserDefaults.inAppShowMilestonePercentageKey, store: UserDefaults.shared)
    private var showMilestonePercentage: Bool = true
    var onDismiss: ()->()
    
    @State private var imageHeight: CGFloat = 0
    
    var body: some View {
        
        VStack(spacing: 15) {
            HStack {
                Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
                    .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                    .background(
                        GeometryReader() { geometry -> Color in
                            DispatchQueue.main.async {
                                self.imageHeight = geometry.size.height
                            }
                            return Color.clear
                        }
                    )
                Text("Relay FM for St. Jude")
                    .font(.headline)
                Spacer()
                Button(action: {
                    self.onDismiss()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: self.imageHeight, height: self.imageHeight, alignment: .center)
                        .foregroundColor(.secondary)
                })
            }
            
            Text("Displays the current Relay FM for St. Jude funraising status.")
                .font(.callout)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 0) {
                Toggle("Show Milestones", isOn: $showMilestones)
                    .padding(10)
                    .padding(.horizontal, 10)
                Divider()
                    .offset(x: 20, y: 0)
                Toggle("Show Full Currency Symbol", isOn: $showFullCurrencySymbol)
                    .padding(10)
                    .padding(.horizontal, 10)
                Divider()
                    .offset(x: 20, y: 0)
                Toggle("Show Main Goal Percentage", isOn: $showGoalPercentage)
                    .padding(10)
                    .padding(.horizontal, 10)
                Divider()
                    .offset(x: 20, y: 0)
                Toggle("Show Milestone Percentage", isOn: $showMilestonePercentage)
                    .padding(10)
                    .padding(.horizontal, 10)
            }
            .background(Color(UIColor.quaternarySystemFill))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            
            Spacer()
            
        }
        .padding()
        .background(Color(UIColor.tertiarySystemBackground))
        
    }
}

struct WidgetSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetSettingsView(onDismiss: {})
    }
}