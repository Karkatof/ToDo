//
//  ViewModel.swift
//  ToDo
//
//  Created by Duxxless on 01.06.2022.
//

protocol ViewModelDelegate {
    func showAlert()
}

import Foundation
import RealmSwift

class TasksListTableViewViewModel: TasksListTableViewViewModelType {

    var delegate: TasksListDelegate
    
    var tasksLists: Results<TasksList> = realm.objects(TasksList.self).sorted(byKeyPath: "date", ascending: false)
    
    var numberOfRows: Int {
            return tasksLists.count
        }
    
    init() {
        self.delegate = TasksListTableVC()
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TasksListTableViewCellViewModelType? {
        let taskList = tasksLists[indexPath.row]
        return TasksListTableViewCellViewModel(taskList: taskList)
    }
    
    func createTask() {
        delegate.showAlert(nil, complition: nil)
    }
    func updateTask(_ indexPath: IndexPath) {
        delegate.showAlert(tasksLists[indexPath.row]) {
            self.delegate.updateTableView(indexPath)
        }
    }
}