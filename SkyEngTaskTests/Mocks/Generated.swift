// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class NetworkRequestMock: NetworkRequest {

    //MARK: - cancelRequest

    var cancelRequestCallsCount = 0
    var cancelRequestCalled: Bool {
        return cancelRequestCallsCount > 0
    }
    var cancelRequestClosure: (() -> Void)?

    func cancelRequest() {
        cancelRequestCallsCount += 1
        cancelRequestClosure?()
    }

}
class WordServiceMock: WordService {

    //MARK: - search

    var searchPagePageSizeCallbackCallsCount = 0
    var searchPagePageSizeCallbackCalled: Bool {
        return searchPagePageSizeCallbackCallsCount > 0
    }
    var searchPagePageSizeCallbackReceivedArguments: (search: String, page: Int, pageSize: Int, callback: ResultCallback<[Word]>)?
    var searchPagePageSizeCallbackReceivedInvocations: [(search: String, page: Int, pageSize: Int, callback: ResultCallback<[Word]>)] = []
    var searchPagePageSizeCallbackReturnValue: NetworkRequest?
    var searchPagePageSizeCallbackClosure: ((String, Int, Int, @escaping ResultCallback<[Word]>) -> NetworkRequest?)?

    func search(_ search: String,                page: Int,                pageSize: Int,                callback: @escaping ResultCallback<[Word]>) -> NetworkRequest? {
        searchPagePageSizeCallbackCallsCount += 1
        searchPagePageSizeCallbackReceivedArguments = (search: search, page: page, pageSize: pageSize, callback: callback)
        searchPagePageSizeCallbackReceivedInvocations.append((search: search, page: page, pageSize: pageSize, callback: callback))
        return searchPagePageSizeCallbackClosure.map({ $0(search, page, pageSize, callback) }) ?? searchPagePageSizeCallbackReturnValue
    }

}
@testable import SkyEngTask
