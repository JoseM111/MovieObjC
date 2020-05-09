import UIKit

class MovieTableViewController: UITableViewController {
    
    // MARK: _@IBOutlet
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    // MARK: @Property
    var moviesArray: [JMMovieResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieSearchBar.delegate = self
    }
    
    // MARK: - Table view data source
    
    /**©------------------------------------------------------------------------------©*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        moviesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieCustomTableViewCell else { return UITableViewCell() }
        
        // Gettting our movie object
        let movie = moviesArray[indexPath.row]
        cell.updateCell(newMovie: movie)
        
        return cell
    }
    /**©------------------------------------------------------------------------------©*/
}/// END OF CLASS

// MARK: _@extention of MovieTableViewController: UISearchBarDelegate
/**©------------------------------------------------------------------------------©*/
extension MovieTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        JMMovieModelController.fetchMovie(forSearchTerm: searchTerm) { (movies) in
            
            if let movies = movies {
                self.moviesArray = movies
                // MARK: _@main thread
                /**©-----------------------------©*/
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                /**©-----------------------------©*/
            }
        }
    }
}
/**©------------------------------------------------------------------------------©*/
