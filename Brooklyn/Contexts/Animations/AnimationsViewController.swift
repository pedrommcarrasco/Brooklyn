//
//  AnimationsViewController.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 19/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Cocoa
import AVKit

// MARK: - AnimationsViewController
final class AnimationsViewController: NSViewController {

    // MARK: Constant
    private enum Constant {
        static let intercellSpacing = NSSize(width: 0, height: 8)
    }

    // MARK: Outlets
    @IBOutlet private weak var dataTableView: NSTableView!
    @IBOutlet private weak var previewView: AVPlayerView!

    // MARK: Private Properties
    private var looper: AVPlayerLooper?
    private let data = Video.allCases
}

// MARK: - Lifecycle
extension AnimationsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Configuration
private extension AnimationsViewController {

    func configure() {
        setupTableView()
        setupPlayer()
    }

    func setupTableView() {
        dataTableView.dataSource = self
        dataTableView.delegate = self
        dataTableView.intercellSpacing = Constant.intercellSpacing
        dataTableView.selectionHighlightStyle = .none
    }

    func setupPlayer() {
        let player = AVQueuePlayer()
        self.looper = AVPlayerLooper.make(for: player, with: .all, for: AnimationsViewController.self)
        previewView.player = player
        previewView.player?.play()
    }
}

// MARK: - NSTableViewDataSource
extension AnimationsViewController: NSTableViewDataSource {

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
extension AnimationsViewController: NSTableViewDelegate { }

