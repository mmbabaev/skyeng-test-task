//
//  Result.swift
//  SkyEngTask
//
//  Created by Mikhail on 27.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

typealias ResultCallback<T> = (Result<T>) -> Void

enum Result<T> {
    case
    success(T),
    failure(AppError)
}

extension Result {
    
    var value: T? {
        switch self {
        case .success(let result):
            return result
        case .failure:
            return nil
        }
    }
    
    var error: AppError? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
    
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    var isFailure: Bool {
        return !isSuccess
    }
}

extension Result where T == Void {
    static let success = Result.success(())
}
