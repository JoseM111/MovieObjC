import UIKit

class MovieCustomTableViewCell: UITableViewCell {

   // MARK: _@IBOutlet
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieDiscriptionLabel: UILabel!
    
    func updateCell(newMovie movie: JMMovieResponse) {
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = "Movie Rating: \(movie.rating) 👍🏾 👎🏾"
        movieDiscriptionLabel.text = movie.movieDescription
    }
}
