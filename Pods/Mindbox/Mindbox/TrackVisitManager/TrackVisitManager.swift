//
//  TrackVistiManager.swift
//  Mindbox
//
//  Created by Maksim Kazachkov on 15.04.2021.
//  Copyright © 2021 Mikhail Barilov. All rights reserved.
//

import UIKit

final class TrackVisitManager {
    private let databaseRepository: MBDatabaseRepository

    init(
        databaseRepository: MBDatabaseRepository
    ) {
        self.databaseRepository = databaseRepository
    }

    func track(_ type: TrackVisitType) throws {
        switch type {
        case let .launch(options), let .launchScene(options):
            try handleLaunch(options)
        case let .universalLink(userActivity):
            try handleUniversalLink(userActivity)
        case let .push(response):
            try handlePush(response)
        }
    }
    
    func trackForeground() throws {
        let encodable = TrackVisit()
        Log("Tracked Visit event type direct").category(.visit).level(.info).make()
        try sendTrackVisit(encodable)
    }

    func trackDirect() throws {
        let encodable = TrackVisit(source: .direct)
        Log("Tracked Visit event type direct").category(.visit).level(.info).make()
        try sendTrackVisit(encodable)
    }

    private func handleLaunch(_ options: LaunchOptions?) throws {
        guard let options = options else { return }
        
        if #available(iOS 13.0, *),
           case let sceneOptions as UIScene.ConnectionOptions = options,
           let userActivity = sceneOptions.userActivities.first,
           userActivity.activityType == NSUserActivityTypeBrowsingWeb
        {
            try handleUniversalLink(userActivity)
        }
    }

    private func handleUniversalLink(_ userActivity: NSUserActivity) throws {
        let encodable = TrackVisit(url: userActivity.webpageURL, source: .link)
        try sendTrackVisit(encodable)
        Log("Tracked Visit event type: universal link").category(.visit).level(.info).make()
    }

    private func handlePush(_ response: UNNotificationResponse) throws {

        let encodable = TrackVisit(source: .push)
        try sendTrackVisit(encodable)
        Log("Tracked Visit event type: push").category(.visit).level(.info).make()
    }
    
    private func sendTrackVisit<E: Encodable>(_ encodable: E) throws {
        let event = Event(type: .trackVisit, body: BodyEncoder(encodable: encodable).body)
        try databaseRepository.create(event: event)
    }
}

public enum TrackVisitType {
    case universalLink(NSUserActivity)
    case push(UNNotificationResponse)
    case launch(LaunchOptions?)
    case launchScene(LaunchOptions?)
}

public protocol LaunchOptions {}

extension Dictionary: LaunchOptions where Key == UIApplication.LaunchOptionsKey, Value == Any {}

@available(iOS 13.0, *)
extension UIScene.ConnectionOptions: LaunchOptions {}
