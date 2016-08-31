//
//  ViewController.swift
//  websocket-sample
//
//  Created by hiro on 2016/08/31.
//  Copyright © 2016年 zaru. All rights reserved.
//

import UIKit
import Starscream

class ViewController: UIViewController, WebSocketDelegate {
    
    let socket = WebSocket(url: NSURL(string: "ws://local.talkbattle.com:3000/cable")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        socket.delegate = self
        socket.connect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func websocketDidConnect(socket: WebSocket) {
        print("websocket is connected")
    }
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print("websocket is disconnected: \(error?.localizedDescription)")
    }
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        print("got some text: \(text)")
    }
    func websocketDidReceiveData(socket: WebSocket, data: NSData) {
        print("got some data: \(data.length)")
    }
    func websocketDidReceivePong(socket: WebSocket) {
        print("Got pong!")
    }

}

