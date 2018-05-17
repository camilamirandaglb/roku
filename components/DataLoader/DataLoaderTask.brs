sub init()
  m.top.functionName="loadData"
end sub

function loadData() as void
    info = ReadAsciiFile("pkg:/source/api.json")
    m.top.data= ParseJson(info)
end function
