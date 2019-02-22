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
    @IBOutlet private weak var previewLabel: NSTextField!
    
    // MARK: Private Properties
    private let animationManager = AnimationsManager()
}

// MARK: - Lifecycle
extension PreferencesWindowController {
   
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
        setupLabel()
    }
    
    func setupTableView() {
        animationsTableView.dataSource = self
        animationsTableView.delegate = self
        animationsTableView.intercellSpacing = Constant.intercellSpacing
    }
    
    func setupPlayer() {
        animationPlayerView.player = animationManager.player
        animationPlayerView.player?.play()
    }
    
    func setupLabel() {
        previewLabel.stringValue = animationManager.selectedAnimations.first?.name ?? ""
    }
}

// MARK: - NSTableViewDataSource
extension PreferencesWindowController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return animationManager.availableAnimations.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.dequeueCell(for: self, as: AnimationCellView.self)
        let item = animationManager.availableAnimations[row]
        cell.configure(with: item.name, state: animationManager.selectedAnimations.contains(item) ? .on : .off)
        cell.onToogle = { [weak animationManager] in animationManager?.toogle(item) }
        return cell
    }
}

// MARK: - NSTableViewDelegate
extension PreferencesWindowController: NSTableViewDelegate {

    func tableViewSelectionDidChange(_ notification: Notification) {
        // TODO: USE SAFE
        let selectedAnimation = animationManager.availableAnimations[animationsTableView.selectedRow]
        previewLabel.stringValue = selectedAnimation.name
        animationManager.preview(selectedAnimation)
    }
}

// MARK: - Actions
private extension PreferencesWindowController {
    
    @IBAction func doneAction(_ sender: NSButton) {
        guard let window = window else { return }
        window.endSheet(window)
    }
}
