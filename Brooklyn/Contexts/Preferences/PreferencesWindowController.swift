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
    @IBOutlet private weak var loopsComboBox: NSComboBox!
    @IBOutlet weak var randomOrderCheckBox: NSButton!
    
    // MARK: Private Properties
    private let manager = BrooklynManager(mode: .preferences)
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
        setupLabels()
        setupBoxes()
    }
    
    func setupTableView() {
        animationsTableView.dataSource = self
        animationsTableView.delegate = self
        animationsTableView.intercellSpacing = Constant.intercellSpacing
    }
    
    func setupPlayer() {
        animationPlayerView.player = manager.player
        animationPlayerView.player?.play()
    }
    
    func setupLabels() {
        previewLabel.stringValue = manager.selectedAnimations.first?.name ?? ""
    }
    
    func setupBoxes() {
        loopsComboBox.selectItem(at: manager.numberOfLoops)
        loopsComboBox.delegate = self
        
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
        manager.preview(selectedAnimation)
    }
}

// MARK: - NSComboBoxDelegate
extension PreferencesWindowController: NSComboBoxDelegate {
    
    func comboBoxSelectionDidChange(_ notification: Notification) {
        manager.setNumberOfLoops(to: loopsComboBox.indexOfSelectedItem)
    }
}

// MARK: - Actions
private extension PreferencesWindowController {
    
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
        guard let window = window else { return }
        window.endSheet(window)
    }
}
