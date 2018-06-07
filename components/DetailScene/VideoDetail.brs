sub showDetail()

      
      m.homelist.visible=false
      m.VideoDetailScreen.visible = true
      m.VideoDetailScreen.setFocus(true)

      selectedMovie = RedokuGetState().selectedMovie
      m.VideoDetailScreen.poster = selectedMovie.item.poster
      m.VideoDetailScreen.description = selectedMovie.item.description
      m.VideoDetailScreen.title = selectedMovie.item.title

end sub


sub playVideo()
    ' m.Video.visible = false
    selectedMovie  = RedokuGetState().selectedMovie
    if selectedMovie <> invalid

        m.Video.visible=true

        Content = CreateObject("roSGNode", "ContentNode")
        Content.streamformat = "m3u8"
        Content.url = selectedMovie.item.video
        Content.Description = selectedMovie.item.description
        Content.Title = selectedMovie.item.title

        m.VideoDetailScreen.visible = false

        m.Video.visible=true
        m.Video.setFocus(true)


        m.Video.content = Content
        m.Video.control = "play"
    end if

end sub

sub stopVideo()
    stopPlayer()
    m.Video.visible = false
    createAndOpenDetailScene()
end sub
