function GetStyles() as Object
    return {
        classes: {
            ' HomeScene
            homeList: {
                itemComponentName: "HomeListItem",
                numRows:"3",
                translation: "[50, 150]",
                itemSize: "[ 2000, 350 ]",
                showRowLabel: "[ true ]",
                rowLabelOffset: "[ [0, 15], [0, 15], [0, 15] ]",
                drawFocusFeedback:true,
                vertFocusAnimationStyle:"fixedFocusWrap",
                rowFocusAnimationStyle: "fixedFocusWrap",
                visible: true,
                rowItemSize:"[[500, 285]]",
                itemSpacing:"[0, 80]",
                rowItemSpacing: " [[30, 0]]"
            },
            video: {
                   width:"1920",
                   height:"1080",
                   visible:false
            },

            videoDetail:{
                visible: false
            },

            'Home List item
            homeListItemLayout: {
                  layoutDirection: "vert",
                  vertAlignment:"top",
                  translation:"[0, 0]"
            },

            homeListItemPoster: {
                  width:"500",
                  height: "290"
            },

            homeListItemLabel: {
                   height: "60",
                   width: "0",
                   horizAlign: "left",
                   vertAlign: "center",
                   translation: "[318,8]"
            },

            'Video detail scene

            videoDetailLeftLayoutGroup:{
                translation:"[450,300]"
            },

            videoDetailPoster: {
                width:"480",
                height:"320"
            },

            labelList: {
                 vertFocusAnimationStyle:"fixedFocusWrap"
            },

            videoDetailRightLayoutGroup:{
                  vertAlignment:"top",
                  horizAlignment:"left",
                  translation:"[1000,300]"
            },

            videoDescription:{
                  width:"630",
                  wrap:true
            }

        }
    }
end function
