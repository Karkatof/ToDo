//
//  TasksTableViewViewModelType.swift
//  ToDo
//
//  Created by Duxxless on 08.06.2022.
//

import Foundation

protocol TasksTableViewCellViewModelProtocol {
    var titleLabel: String { get }
    var detailLabel: String { get }
    func isComplited()
}
