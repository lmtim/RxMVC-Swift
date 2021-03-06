//
//  MVC.swift
//  RxMVC
//
//  Created by 최건우 on 2016. 4. 22..
//  Copyright © 2016년 Choi Geonu. All rights reserved.
//

import Foundation
import RxSwift

public func combineModel
    <M: Model, V: View, U: UserInteractable, C: Controller where
    M.State == V.State, U.Event == C.Event, C.Action == M.Action>
    (model: M, withView view: V, controller: C, andUserInteractable userInteractable: U) -> Disposable {
    return view.update(model.manipulate(controller.use(userInteractable.interact())))
}