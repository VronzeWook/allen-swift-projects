//
//  ViewController.swift
//  TableView
//
//  Created by 이동욱 on 2023/11/07.
//

import UIKit

class ViewController: UIViewController {

    // 테이블뷰의 데이터를 표시하기 위한 배열
    var moviesArray: [Movie] = []
    var movieDataManager = dataManager()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 120
        tableView.delegate = self
        
        title = "영화 목록"
        
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        movieDataManager.updateMovieData()
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource{
    
    // 몇개의 컨텐츠를 만들면 되는지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return movieDataManager.getMovieData().count
    }

    // 몇 번째 셀은 어떤 방식으로 표시할지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movieDataManager.getMovieData()[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLable.text = movie.movieName
        cell.descriptionLable.text = movie.movieDescription
        
//      cell.selectionStyle = .default
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            
            let array = movieDataManager.getMovieData()
            
            let indexPath = sender as! IndexPath
            
            detailVC.movieData = array[indexPath.row]
            
        }
    }
}
