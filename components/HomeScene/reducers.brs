function moviesReducer(state as dynamic, action as object) as object
      if action <> invalid
         if action.type = ActionType().ADD_MOVIE then
            newMovies = []

            movies = action.movies
            newMovies = movies

            newState = RedokuClone(state)
            newState.items = newMovies
            return newState
        end if
      end if
      return state

end function

function playerReducer(state as dynamic, action as object) as object
      if action <> invalid
        if action.type = ActionType().START_PLAYER
            newState = RedokuClone(state)
            newState.isPlaying = true
            return newState

        else if action.type = ActionType().STOP_PLAYER
            newState = RedokuClone(state)
            newState.isPlaying = false
            return newState
        end if
      end if
      return state
end function

function selectedMovieReducer(state as dynamic, action as object) as Object
      if action <> invalid
        if action.type = ActionType().SELECT_MOVIE
            newMovie =  action.selectedMovie
            newState = RedokuClone(state)
            newState.item = newMovie
            newState.id= createObject("roDeviceInfo").getRandomUUID()
            return newState
        end if
     end if
     return state
end function

function styleReducer(state as dynamic, action as object) as object
    if action <> invalid then
        if action.type = ActionType().LOAD_STYLES
            newState = RedokuClone(state)
            newState.items = action.styles
            print "LOAD_STYLES NewState(Redoku) " ; newState.items
            return newState
        end if
    end if

    return state
end function
