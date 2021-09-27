//
//  DefaultParameters.swift
//  DZ№2
//
//  Created by Egor Malyshev on 25.09.2021.
//

import Foundation

class DefaultParameters {
    class func get() -> [String: CustomStringConvertible] {
        let timeStamp = "1"
        let apikey = "c8cce733c1ae9c4c04fb6eee09fb2b6f"
        let hash = "81de515864211389bf324eab33604847"
        return ["ts": timeStamp,
                "apikey": apikey,
                "hash": hash]
    }
}
