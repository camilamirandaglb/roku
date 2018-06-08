sub init()
    m.leftLayoutGroup = m.top.findNode("leftLayoutGroup")
    m.rightLayoutGroup = m.top.findNode("rightLayoutGroup")
    m.optionList = m.top.findNode("options")
    m.description= m.top.findNode("videoDescription")
    m.poster = m.top.findNode("detailPoster")

    m.backPressed = m.top.findNode("backPressed")

    m.top.observeField("visible", "onVisibleChange")

    SetStyles()
end sub

sub SetStyles()
    styles = getClassesFromJson()

    m.leftLayoutGroup.setfields(styles.leftLayoutGroup)
    m.rightLayoutGroup.setfields(styles.rightLayoutGroup)
    m.optionList.setfields(styles.options)
    m.description.setfields(styles.description)
    m.poster.setfields(styles.image)
end sub

sub descriptionChanged()
  m.description.text = m.top.description
end sub

sub posterChanged()
  m.poster.uri = m.top.poster
end sub

sub onVisibleChange()
  if m.top.visible
    m.optionList.setFocus(true)
  end if
end sub

sub handleSelectedOption(option as string)
    if option = "Play Video"
            startPlayer() 'redoku
    else if option = "Back"
        m.top.backPressed= true
        m.top.visible= false
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as boolean
        isPlaying = RedokuGetState().player.isPlaying

        if NOT isPlaying AND key = "OK" then
                selectedItem = m.optionList.content.getChild(m.optionList.itemFocused).title
                handleSelectedOption(selectedItem)
                return true
        end if
        return false
end function
