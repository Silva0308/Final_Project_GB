//
//  FlightTableViewCell.swift
//  AirportTimetable
//
//  Created by MacBook Pro on 14/09/23.
//

import UIKit
//Класс ячейки таблицы FlightTableViewCell, которая содержит четыре метки: flightNumberLabel, flightNameLabel, planeNameLabel и timeLabel. Метка flightNumberLabel поддерживает только одну строку, а остальные метки поддерживают бесконечное количество строк. 
//
final class FlightTableViewCell: UITableViewCell {

    private lazy var flightNumberLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var flightNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var planeNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews(flightNumberLabel, flightNameLabel, planeNameLabel, timeLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with schedule: ScheduleInformation) {
        flightNumberLabel.text = schedule.thread.number
        flightNameLabel.text = schedule.thread.title
        planeNameLabel.text = schedule.thread.vehicle != nil ? schedule.thread.vehicle : "No information"
        timeLabel.text = schedule.arrival != nil ? schedule.arrival : schedule.departure
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            contentView.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        flightNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        flightNameLabel.translatesAutoresizingMaskIntoConstraints = false
        planeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                flightNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                flightNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                flightNumberLabel.widthAnchor.constraint(equalToConstant: 200),
                
                flightNameLabel.topAnchor.constraint(equalTo: flightNumberLabel.bottomAnchor, constant: 8),
                flightNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                flightNameLabel.widthAnchor.constraint(equalToConstant: 300),
                
                planeNameLabel.topAnchor.constraint(equalTo: flightNameLabel.bottomAnchor, constant: 8),
                planeNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                planeNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                planeNameLabel.widthAnchor.constraint(equalToConstant: 200),
                
                timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
            ]
        )
    }
}
