//
//  WidgetFamily.swift
//  WidgetFamily
//
//  Created by David on 25/08/2021.
//

import Foundation
import WidgetKit

func supportedFamilies() -> [WidgetFamily] {
    var families: [WidgetFamily] = [.systemSmall, .systemMedium, .systemLarge]
    
    #if os(iOS)
    if #available(iOS 16.0, iOSApplicationExtension 16.0, *) {
        families.append(.accessoryRectangular)
    }
    if #available(iOS 15.0, iOSApplicationExtension 15.0, *) {
        families.append(.systemExtraLarge)
    }
    #endif
    
    return families
}

#if os(iOS)
func isLargeSize(family: WidgetFamily) -> Bool {
    if #available(iOS 15.0, iOSApplicationExtension 15.0, *) {
        return family == .systemLarge || family == .systemExtraLarge
    } else {
        return family == .systemLarge
    }
}
#else
func isLargeSize(family: WidgetFamily) -> Bool {
    return family == .systemLarge
}
#endif

#if os(iOS)
func isExtraLargeSize(family: WidgetFamily) -> Bool {
    if #available(iOS 15.0, iOSApplicationExtension 15.0, *) {
        return family == .systemExtraLarge
    } else {
        return false
    }
}
#else
func isExtraLargeSize(family: WidgetFamily) -> Bool {
    return false
}
#endif

// Technically supports watchOS too, but we don't have a Watch app
#if os(iOS)
func isAccessoryRectangularSize(family: WidgetFamily) -> Bool {
    if #available(iOS 16.0, iOSApplicationExtension 16.0, *) {
        return family == .accessoryRectangular
    } else {
        return false
    }
}
#else
func isAccessoryRectangularSize(family: WidgetFamily) -> Bool {
    return false
}
#endif
