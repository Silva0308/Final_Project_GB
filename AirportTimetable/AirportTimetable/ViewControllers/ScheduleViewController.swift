//
//  ViewController.swift
//  AirportTimetable
//
//  Created by MacBook Pro on 14/09/23.
//

import UIKit

final class ScheduleViewController: UIViewController {

    var webURL: String!
    
    private lazy var scheduleTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    private lazy var copyrightView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var urlLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private var schedule: [ScheduleInformation] = []
    
    private let cellID = "flight"
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupSubviews(scheduleTableView, copyrightView, infoLabel, urlLabel)
        setConstraints()
        
        scheduleTableView.dataSource = self
        scheduleTableView.register(FlightTableViewCell.self, forCellReuseIdentifier: cellID)
        
        fetchSchedule()
        fetchCopyright()
    }
    
    private func fetchSchedule() {
        guard let url = URL(string: webURL) else { return }
        
        networkManager.fetch(Schedule.self, from: url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.schedule = data.schedule
                self?.scheduleTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchCopyright() {
        guard let url = URL(
            string: "https://api.rasp.yandex.net/v3.0/copyright/?apikey=12661f47-954a-427c-bbde-97de19cd1fb9&format=json"
        ) else {
            return
        }
        
        networkManager.fetch(Copyright.self, from: url) { [weak self] result in
            switch result {
            case .success(let copyright):
                self?.infoLabel.text = copyright.copyright.text
                self?.urlLabel.text = copyright.copyright.url
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        copyrightView.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        urlLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduleTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                copyrightView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                copyrightView.heightAnchor.constraint(equalToConstant: 100),
                copyrightView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                copyrightView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                
                infoLabel.topAnchor.constraint(equalTo: copyrightView.topAnchor, constant: 8),
                infoLabel.leadingAnchor.constraint(equalTo: copyrightView.leadingAnchor, constant: 8),
                infoLabel.trailingAnchor.constraint(equalTo: copyrightView.trailingAnchor, constant: -8),
                
                urlLabel.bottomAnchor.constraint(equalTo: copyrightView.bottomAnchor, constant: -8),
                urlLabel.leadingAnchor.constraint(equalTo: copyrightView.leadingAnchor, constant: 8),
                urlLabel.trailingAnchor.constraint(equalTo: copyrightView.trailingAnchor, constant: -8),
                
                scheduleTableView.topAnchor.constraint(equalTo: view.topAnchor),
                scheduleTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                scheduleTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scheduleTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}

// MARK: - UITableViewDataSource
extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        schedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = scheduleTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        guard let cell = cell as? FlightTableViewCell else { return UITableViewCell() }
        
        let schedule = schedule[indexPath.row]
        
        cell.selectionStyle = .none
        cell.configure(with: schedule)
        
        return cell
    }
    
    
}
