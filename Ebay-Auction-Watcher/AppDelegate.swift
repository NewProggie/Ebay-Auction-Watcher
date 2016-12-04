// Copyright (c) 2016, Kai Wolf. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file in the top directory.

import Cocoa

@NSApplicationMain
class AppDelegate : NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    let statusItem = NSStatusBar.system().statusItem(withLength: -2);
    let popover = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
            button.action = #selector(AppDelegate.togglePopover)
        }

        popover.contentViewController = AuctionViewController(nibName: "AuctionViewController", bundle: nil)

    }


    func showPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }

    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
    }

    func togglePopover(sender: AnyObject?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }


    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
