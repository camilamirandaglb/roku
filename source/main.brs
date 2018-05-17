sub Main()
  screen= CreateObject("roSGScreen")
  m.port= CreateObject("roMessagePort")

  screen.setMessagePort(m.port)

  scene = screen.CreateScene("HomeListScene")

  screen.show()

  while(true)
        'check for generic message port messages
        msg = m.port.GetMessage()
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            'If the screen has been closed, shutdown and exit the app
            if msg.isScreenClosed()
                return
            end if
        end if
    end while
end sub
