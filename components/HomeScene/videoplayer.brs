sub playVideo()
    m.homelist.visible=false
    m.Video.visible = false

    selectedContent = getSelectedContent()

    if selectedContent <> invalid
        startPlayer()

        m.Video.visible=true
        m.Video.setFocus(true)
        Content = CreateObject("roSGNode", "ContentNode")
        Content.streamformat = "m3u8"
        Content.url = selectedContent.video
        Content.Description = selectedContent.description
        Content.Title = selectedContent.title
        m.Video.content = Content
        m.Video.control = "play"
    end if
end sub
