//
//  WebSocketManager.swift
//  WebSocketTest
//
//  Created by Archie on 2019/6/27.
//  Copyright © 2019 Archie. All rights reserved.
//

import Foundation

final class WebSocketManager {
    static let shared = WebSocketManager()

    private var webSocketTask: URLSessionWebSocketTask?

    func connect() {
        webSocketTask = URLSession.shared.webSocketTask(with: URL(string: "wss://echo.websocket.org")!)
        webSocketTask?.resume()
        readMessage()
    }

    func disconnect() {
        print("disconnect")
        webSocketTask?.cancel()
        webSocketTask = nil
    }

    func login(username: String, password: String) {
        webSocketTask?.send(.string(username)) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func readMessage() {
        guard let task = webSocketTask else { return }
        task.receive { result in
            switch result {
            case .success(.data(let data)):
                print(data)
                self.readMessage()
            case .failure(let error):
                print(error)
                print(error.localizedDescription)
                self.disconnect()
            default:
                self.disconnect()
            }
        }
    }
}
