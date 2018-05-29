function moviesReducer(state as dynamic, action as object) as object
      if action <> invalid
         if action.type = ActionType().ADD_MOV then
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
            newState.status = true
            return newState

        else if action.type = ActionType().STOP_PLAYER
            newState = RedokuClone(state)
            newState.status = true
            return newState
        end if
      end if
      return state
end function
