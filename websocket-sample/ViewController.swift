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
    
    @IBOutlet weak var btn: UIButton!
    @IBAction func btnClick(sender: AnyObject) {
        print("click button")
        socket.writeString("{\"command\":\"message\",\"identifier\":\"{\\\"channel\\\":\\\"RoomChannel\\\"}\",\"data\":\"{\\\"data\\\":{\\\"room_id\\\":\\\"2\\\",\\\"user_id\\\":\\\"5\\\",\\\"comment\\\":\\\"fuga\\\"},\\\"action\\\":\\\"speak\\\"}\"}")
    }
    
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
        socket.writeString("{\"command\":\"subscribe\",\"identifier\":\"{\\\"channel\\\":\\\"RoomChannel\\\"}\"}")
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

