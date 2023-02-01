//
//  URLLookupDimensions.swift
//  URLScanner
//
//  Created by Victor Proppe on 01/02/23.
//

extension URLLookupViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setConstraintsInsertUrlLabel()
        setConstraintsUrlField()
        setConstraintsFetchButton()
        setConstraintsCircularProgress()
    }
    
    func setConstraintsInsertUrlLabel() {
        [
            insertURLLabel.bottom.constraint(equalTo: urlField.top, constant: -15),
            insertURLLabel.centerX.constraint(equalTo: view.centerX)
        ].activate()
    }
    
    func setConstraintsUrlField() {
        [
            urlField.centerX.constraint(equalTo: view.centerX),
            urlField.width.constraint(equalTo: view.width, constant: -40),
            urlField.height.constraint(equalToConstant: 40),
            urlField.centerY.constraint(equalTo: view.centerY)
        ].activate()
    }
    
    func setConstraintsFetchButton() {
        [
            fetchButton.top.constraint(equalTo: urlField.bottom, constant: 10),
            fetchButton.width.constraint(equalToConstant: 100),
            fetchButton.height.constraint(equalToConstant: 100),
            fetchButton.centerX.constraint(equalTo: view.centerX)
        ].activate()
    }
    
    func setConstraintsCircularProgress() {
        [
            circularProgress.top.constraint(equalTo: fetchButton.top),
            circularProgress.width.constraint(equalToConstant: 100),
            circularProgress.height.constraint(equalToConstant: 100),
            circularProgress.centerX.constraint(equalTo: view.centerX)
        ].activate()
    }
}
