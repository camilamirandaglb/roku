sub init()
    m.homelist = m.top.FindNode("homeList")
    m.Video = m.top.findNode("myVideo")
    m.VideoDetailScreen = m.top.findNode("VideoDetailScreen")


    m.homelist.setfocus(true)
    RedokuRegisterReducer("movies", moviesReducer)
    RedokuRegisterReducer("player", playerReducer)
    RedokuRegisterReducer("selectedMovie", selectedMovieReducer)

    RedokuInitialize()

    m.global.observeField("state", "onStateChange")
    m.VideoDetailScreen.observeField("visible", "onDetailScreenChanged")

    AsyncLoadMoviesAction()
    SetStyles()

end sub

sub SetStyles()

    styles = getClassesFromJson()
    m.homelist.setfields(styles.rows)
    m.VideoDetailScreen.setfields(styles.detail)
    m.Video.setfields(styles.video)

end sub

sub onStateChange()
    state= RedokuGetState()
    prevState = RedokuGetPrevState()

    if(state.movies.count() <> prevState.movies.count()) then
            showMovies(state.movies.items)
    end if

    if(prevState.selectedMovie.id <> invalid)
      if state.selectedMovie.id <> prevState.selectedMovie.id  then
            createAndOpenDetailScene()
      end if
    end if

    if (state.player.isPlaying <> prevState.player.isPlaying) then
        if state.player.isPlaying
            playVideo()
        else
            m.Video.visible = false
            createAndOpenDetailScene()
        end if
    end if

    'so, let's see if the player is now "playing" to bing up the Video component

end sub

sub showMovies(movies)
    m.homelist.content = movies
end sub

function getSelectedContent() as Object
    row = m.homelist.rowItemFocused[0]
    col = m.homelist.rowItemFocused[1]
    selectedItem = m.homelist.content.getChild(row).getChild(col)
    return selectedItem
end function

sub selectedContent()
      movie =  getSelectedContent()
      selectMovie(movie)
end sub

function onKeyEvent(key as String, press as Boolean) as boolean
    handled = false

    if key = "OK"
        if NOT m.VideoDetailScreen.backpressed
           selectedContent()
        end if
        m.VideoDetailScreen.backpressed = false
    else if key = "back" and press
        if RedokuGetState().player.isPlaying ' if the video was playing, it stops and goes to the detail scene.
            stopPlayer()
            handled = true
        else ' if the video wasn't playing, it means it was standing in the detail scene and wants to go back to the home scene.
            hideDetail()
            handled = true
        end if
    end if
    return handled

end function


sub onDetailScreenChanged()
        visibility = NOT m.VideoDetailScreen.visible
        m.homelist.visible= visibility
        m.homelist.setfocus(visibility)
end sub

sub createAndOpenDetailScene()
    if NOT RedokuGetState().player.isPlaying
      showDetail()
    end if
end sub

sub hideDetail()
    print ">>>>In Hide detail>>>"
        m.VideoDetailScreen.visible=false
        m.homelist.visible=true
        m.homelist.setFocus(true)
end sub
