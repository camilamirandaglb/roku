sub Main()
    screen = CreateObject("roSGScreen")
    m.port=CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    scene = screen.CreateScene("HomeScene")

    initializeRedoku(screen)
    screen.show()

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then
              return
            end if
        end if
    end while
end sub

sub initializeRedoku(screen)
  initialState = {
        movies: { },
		    player: {
			     status: false
		    }
    }

  RedokuSetInitialState(initialState, screen)

end sub
