sub AsyncLoadMoviesAction()
    createPromiseFromTask("DataLoaderTask", invalid, "data").then(function(task)
                if task.data <> invalid
                    AddMovies(task.data)
                end if
              end function)
end sub

sub AsynLoadStylesAction()
    createPromiseFromTask("StylesLoaderTask", invalid, "styles"). then(function(task)
                 if task.styles <> invalid
                    LoadStyles(task.styles)
                end if 
                    end function)
  end sub
