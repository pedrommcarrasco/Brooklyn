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
        static let spacebarKeyCode = 0x31
    }
    
    // MARK: Outlets
    @IBOutlet private weak var animationsTableView: NSTableView!
    @IBOutlet private weak var animationPlayerView: PlayerView!
    @IBOutlet private weak var previewLabel: NSTextField!
    @IBOutlet private weak var randomOrderCheckBox: NSButton!
    @IBOutlet private weak var numberOfLoopsPopUp: NSPopUpButton!
    
    // MARK: Private Properties
    private let manager = BrooklynManager(mode: .preferences)
}

// MARK: - Lifecycle
extension PreferencesWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        configure()
    }
    
    override func keyUp(with event: NSEvent) {
        if event.keyCode == Constant.spacebarKeyCode, !event.isARepeat {
            guard !animationsTableView.selectedRowIndexes.isEmpty else { return }
            animationsTableView.selectedRowIndexes.forEach {
                guard $0 >= 0 else { return }
                let selectedCell = animationsTableView.view(atColumn: 0, row: $0, makeIfNecessary: false)
                (selectedCell as? AnimationCellView)?.spacebarAction()
            }
        }
    }
}

// MARK: - Configuration
private extension PreferencesWindowController {
    
    func configure() {
        setupTableView()
        setupPlayer()
        setupLabels()
        setupButtons()
    }
    
    func setupTableView() {
        animationsTableView.dataSource = self
        animationsTableView.delegate = self
        animationsTableView.intercellSpacing = Constant.intercellSpacing
        animationsTableView.allowsMultipleSelection = true
    }
    
    func setupPlayer() {
        animationPlayerView.player = manager.player
        animationPlayerView.player?.play()
    }
    
    func setupLabels() {
        previewLabel.stringValue = manager.selectedAnimations.first?.name ?? ""
    }
    
    func setupButtons() {
        numberOfLoopsPopUp.selectItem(at: manager.numberOfLoops)
        randomOrderCheckBox.state = manager.hasRandomOrder ? .on : .off
    }
}

// MARK: - NSTableViewDataSource
extension PreferencesWindowController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return manager.availableAnimations.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let item = manager.availableAnimations[safe: row] else { return nil }
        let cell = tableView.dequeueCell(for: self, as: AnimationCellView.self)
        cell.configure(with: item.name, state: manager.selectedAnimations.contains(item) ? .on : .off)
        cell.onToogle = { [weak manager] in manager?.toogle(item) }
        return cell
    }
}

// MARK: - NSTableViewDelegate
extension PreferencesWindowController: NSTableViewDelegate {

    func tableViewSelectionDidChange(_ notification: Notification) {
        guard let selectedAnimation = manager.availableAnimations[safe: animationsTableView.selectedRow] else { return }
        previewLabel.stringValue = selectedAnimation.name
        manager.player.play(selectedAnimation)
    }
}

// MARK: - Actions
private extension PreferencesWindowController {
    
    @IBAction func numberOfLoopsAction(_ sender: NSPopUpButtonCell) {
        manager.setNumberOfLoops(to: numberOfLoopsPopUp.indexOfSelectedItem)
    }
    
    @IBAction func randomOrderAction(_ sender: NSButton) {
        manager.toogleHasRandomOrder()
    }
    
    @IBAction func helpAction(_ sender: NSButton) {
        URLType.help.open()
    }
    
    @IBAction func githubAction(_ sender: NSButton) {
        URLType.github.open()
    }
    
    
    @IBAction func twitterAction(_ sender: NSButton) {
        URLType.twitter.open()
    }
    
    @IBAction func doneAction(_ sender: NSButton) {
        animationsTableView.deselectAll(nil)
        guard let window = window else { return }
        window.sheetParent?.endSheet(window)
    }
}
