sub init()
    m.homelist = m.top.FindNode("homeList")
    m.Video = m.top.findNode("myVideo")

    m.homelist.setfocus(true)
    RedokuRegisterReducer("movies", moviesReducer)
    RedokuRegisterReducer("player", playerReducer)
    RedokuInitialize()
    m.global.observeField("state", "onStateChange")
    AsyncLoadMoviesAction()
end sub

sub onStateChange()
    movies = m.global.state.movies.items
    showMovies(movies)
end sub


sub showMovies(movies)
    m.homelist.content = movies
end sub

function getSelectedContent() as object
      row = m.homelist.rowItemFocused[0]
      col = m.homelist.rowItemFocused[1]
      return m.homelist.content.getChild(row).getChild(col)
end function


function onKeyEvent(key as String, press as Boolean) as boolean
    if key = "OK"
        if m.homelist.visible
            m.homelist.visible = false
            playVideo()
        end if
    else if key = "back"
      if m.global.state.player.status
        stopPlayer()
        m.homelist.visible = true
        m.homelist.setFocus(true)
        m.Video.visible = false
        return true
      else
        return false
      end if
    end if
end function
