//
//  AppDelegate.swift
//  brownNoise
//
//  Created by Bill Chen on 2017-11-28.
//  Copyright © 2017 Bill Chen. All rights reserved.
//

import Cocoa
import AVFoundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)
    let menu = NSMenu()
    var player = AVAudioPlayer()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button{
            button.image = NSImage(named:NSImage.Name("on"))
            button.action = #selector(toggleSound(_:))
            
            initMenu()
            initPlayer()
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func toggleSound(_ sender: Any?){
        if let button = statusItem.button{
            button.image = NSImage(named:NSImage.Name("on"))
            if player.isPlaying{
                button.image = NSImage(named:NSImage.Name("off"))
                player.stop()
            }
            else{
                button.image = NSImage(named:NSImage.Name("on"))
                player.play()
            }
        }
    }
    
    func initMenu() {
        let menu = NSMenu()
        
        menu.addItem(NSMenuItem(title: "Toggle Brown Noise", action: #selector(AppDelegate.toggleSound(_:)), keyEquivalent: "t"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        statusItem.menu=menu
    }
    
    func initPlayer(){
        guard let path = Bundle.main.path(forResource: "brownNoise.wav", ofType:nil) else {print("path not found"); return}
        let url = URL(fileURLWithPath: path)
        
        do{
            player = try AVAudioPlayer(contentsOf:url)
            player.prepareToPlay()
            player.numberOfLoops = -1
            player.play()
        } catch {
            print("unable to play")
        }
    }
}

