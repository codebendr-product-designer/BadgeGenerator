//
//  UIView+BadgeFactory.swift
//  CareForMe
//
//  Created by Kenneth Dubroff on 6/22/21.
//

import UIKit

public enum BadgeDirection {
    
    case northEast
    case northWest
    case southEast
    case southWest
    case center
    
}

extension UIView {
    
    /// add a new badge to the view
    /// - Parameters:
    ///   - direction: where the view's x/y boundaries will be anchored
    @discardableResult public func setBadge(in direction: BadgeDirection, with text: String) -> BadgeLabel {
        
        let badge = BadgeLabel(text: text)
        addSubview(badge)        
        
        if #available(iOS 11, *) {
            setBadgeConstraintsInSafeArea(for: badge, in: direction)
        } else {
            setBadgeConstraints(for: badge, in: direction)
        }
        
        return badge
        
    }
    
    /// set a badge's constraints in the given direction's boundaries
    /// - NOTE: requires iOS 11 or greater
    @available(iOS 11, *)
    private func setBadgeConstraintsInSafeArea(for badge: BadgeLabel, in direction: BadgeDirection) {
        
        switch direction {
        
        case .center:
            NSLayoutConstraint.activate([
                badge.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor),
                badge.centerYAnchor.constraint(equalTo:safeAreaLayoutGuide.centerYAnchor),
            ])
        case .northEast:
            NSLayoutConstraint.activate([
                badge.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                badge.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
            ])
        case .northWest:
            NSLayoutConstraint.activate([
                badge.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                badge.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            ])
        case .southEast:
            NSLayoutConstraint.activate([
                badge.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                badge.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            ])
        case .southWest:
            NSLayoutConstraint.activate([
                badge.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                badge.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            ])
        }
        
    }
    
    @available(iOS, deprecated: 11, renamed: "setBadgeConstraintsInSafeArea")
    private func setBadgeConstraints(for badge: BadgeLabel, in direction: BadgeDirection) {
        
        switch direction {
        
        case .center:
            NSLayoutConstraint.activate([
                badge.centerXAnchor.constraint(equalTo: centerXAnchor),
                badge.centerYAnchor.constraint(equalTo: centerYAnchor),
            ])
        case .northEast:
            NSLayoutConstraint.activate([
                badge.topAnchor.constraint(equalTo: topAnchor),
                badge.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        case .northWest:
            NSLayoutConstraint.activate([
                badge.topAnchor.constraint(equalTo: topAnchor),
                badge.leadingAnchor.constraint(equalTo: leadingAnchor),
            ])
        case .southEast:
            NSLayoutConstraint.activate([
                badge.bottomAnchor.constraint(equalTo: bottomAnchor),
                badge.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        case .southWest:
            NSLayoutConstraint.activate([
                badge.bottomAnchor.constraint(equalTo: bottomAnchor),
                badge.leadingAnchor.constraint(equalTo: leadingAnchor),
            ])
        }
    }
    
}
