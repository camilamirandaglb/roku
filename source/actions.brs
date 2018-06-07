function AddMovies(movies as object)
	RedokuDispatch({
		type: ActionType().ADD_MOVIE,
		movies: movies })
end function

function startPlayer()
    RedokuDispatch({
      type: ActionType().START_PLAYER
    })

end function

function stopPlayer()
  RedokuDispatch({
    type: ActionType().STOP_PLAYER
  })
end function

function selectMovie(movie as object)
	RedokuDispatch({
		type: ActionType().SELECT_MOVIE
		selectedMovie: movie
	})
end function
