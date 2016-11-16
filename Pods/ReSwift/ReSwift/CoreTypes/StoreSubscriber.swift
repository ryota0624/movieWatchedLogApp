//
//  StoreSubscriber.swift
//  ReSwift
//
//  Created by Benjamin Encz on 12/14/15.
//  Copyright © 2015 Benjamin Encz. All rights reserved.
//

import Foundation

public protocol AnyStoreSubscriber: class {
    func _newState(_ state: Any)
}

public protocol StoreSubscriber: AnyStoreSubscriber {
    associatedtype StoreSubscriberStateType

    func newState(_ state: StoreSubscriberStateType)
}

extension StoreSubscriber {
    public func _newState(_ state: Any) {
        if let typedState = state as? StoreSubscriberStateType {
            #if swift(>=3)
                newState(typedState)
            #else
                newState(typedState)
            #endif
        }
    }
}
