//
//  PreferencesWindowController.swift
//  BrooklynApplication
//
//  Created by Pedro Carrasco on 19/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Cocoa
import AVKit

// MARK: - PreferencesWindowController
final class PreferencesWindowController: NSWindowController, NSWindowDelegate {
    
    // MARK: Constant
    private enum Constant {
        static let intercellSpacing = NSSize(width: 0, height: 8)
    }
    
    // MARK: Outlets
    @IBOutlet private weak var animationsTableView: NSTableView!
    @IBOutlet private weak var animationPlayerView: AVPlayerView!
    
    // MARK: Private Properties
    private var looper: AVPlayerLooper?
    private let data = Video.allCases
    
    override func windowDidLoad() {
        super.windowDidLoad()
        configure()
    }
}

// MARK: - Configuration
private extension PreferencesWindowController {
    
    func configure() {
        setupTableView()
        setupPlayer()
    }
    
    func setupTableView() {
        animationsTableView.dataSource = self
        animationsTableView.delegate = self
        animationsTableView.intercellSpacing = Constant.intercellSpacing
        animationsTableView.selectionHighlightStyle = .none
    }
    
    func setupPlayer() {
        let player = AVQueuePlayer()
        self.looper = AVPlayerLooper.make(for: player, with: .all, for: PreferencesWindowController.self)
        animationPlayerView.player = player
        animationPlayerView.player?.play()
    }
}

// MARK: - NSTableViewDataSource
extension PreferencesWindowController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return Video.allCases.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.dequeueCell(for: self, as: AnimationCellView.self)
        cell.configure(with: data[row].name, state: .off)
        return cell
    }
}

// MARK: - NSTableViewDelegate
extension PreferencesWindowController: NSTableViewDelegate { }

// MARK: - Actions
private extension PreferencesWindowController {
    
    @IBAction func doneAction(_ sender: NSButton) {
        guard let window = window else { return }
        window.endSheet(window)
    }
}
