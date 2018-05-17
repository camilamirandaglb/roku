sub init()
  m.top.functionName="loadData"
end sub

function loadData() as Void
    data = ReadAsciiFile("pkg:/source/api.json")
    m.data = ParseJson(data)
    print "task is done"
    print m.data
    STOP
end function
