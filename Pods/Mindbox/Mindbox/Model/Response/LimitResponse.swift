//
//  LimitResponse.swift
//  Mindbox
//
//  Created by lbr on 08.06.2021.
//  Copyright © 2021 Mikhail Barilov. All rights reserved.
//

import Foundation

open class LimitResponse: Decodable {
    public let type: LimitTypeResponse?
    public let amount: AmountResponse?
    public let used: UsedResponse?
    public let untilDateTimeUtc: DateTime?
}
