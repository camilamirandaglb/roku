sub AsyncLoadMoviesAction()
    createPromiseFromTask("DataLoaderTask", invalid, "data").then(function(task)
                if task.data <> invalid
                    AddMovies(task.data)
                end if
              end function)
end sub

sub AsyncLoadStylesAction()
        createPromiseFromTask("StylesLoaderTask", "styles").then(function(task)
                styles = task.styles
            end function)
  end sub
