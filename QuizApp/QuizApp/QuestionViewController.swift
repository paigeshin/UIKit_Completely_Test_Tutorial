//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by paige shin on 2022/06/27.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var headerLabel: UILabel!
    private(set) var question: String = ""
    private(set) var options: [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    private let resueIdentifier = "Cell"
    private var selection: (([String]) -> Void)? = nil
    
    convenience init(question: String, options: [String], selection: @escaping([String]) -> Void) {
        self.init()
        self.question = question
        self.options = options
        self.selection = selection
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = question
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueCell(in: tableView)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(selectedOptions(in: tableView))
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView.allowsMultipleSelection {
            selection?(selectedOptions(in: tableView))
        }
    }
    
    func selectedOptions(in tableView: UITableView) -> [String] {
        guard let indexPaths = tableView.indexPathsForSelectedRows else {
            return []
        }
        return indexPaths.map { options[$0.row] }
    }
    
    private func dequeueCell(in tableView: UITableView) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: resueIdentifier) {
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: resueIdentifier)
    }
    
}
