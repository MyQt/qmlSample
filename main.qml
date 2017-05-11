import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: window
    visible: true
    width: 1366
    height: 768
    property alias image1Visible: image1.visible
    title: qsTr("qml示例")
    property alias mouseArea: mouseArea

    MainForm {
        color: "#f3b1f7"
        anchors.rightMargin: 0
        anchors.bottomMargin: 7
        anchors.leftMargin: 0
        anchors.topMargin: -7
        transformOrigin: Item.Center
        anchors.fill: parent
        clip: true
        antialiasing: true
        z: 2
        border.color: "#eaea19"
        opacity: 0.9
        mouseArea.onClicked: {
            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
        }

        Text {
            id: text1
            x: 8
            y: 195
            width: 24
            height: 217
            color: "#9f0000"
            text: qsTr("这\n是\n一\n个\nqml\n例\n子")
            style: Text.Sunken
            font.weight: Font.DemiBold
            font.capitalization: Font.AllUppercase
            font.bold: true
            font.strikeout: false
            font.underline: false
            font.italic: true
            font.family: "Times New Roman"
            styleColor: "#da0606"
            fontSizeMode: Text.Fit
            textFormat: Text.AutoText
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideMiddle
            font.pixelSize: 28
        }

        Image {
            id: image
            x: 0
            y: 0
            width: 100
            height: 149
            source: "../../../Pictures/龙珠18号.png"
        }

        BorderImage {
            id: borderImage
            x: 1266
            y: 0
            width: 100
            height: 149
            source: "../../../Pictures/龙珠18号.png"
        }

        TextInput {
            id: textInput
            x: 543
            y: 523
            width: 161
            height: 44
            text: qsTr("Text Input：单行输入")
            inputMask: qsTr("")
            cursorVisible: true
            font.bold: true
            font.family: "Verdana"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12
            wrapMode: TextInput.Wrap
            selectByMouse: true
            focus: true
            Text {
                id: text2
                x: 0
                y: 57
                width: 161
                height: 43
                color: "#c3139c"
                text: textInput.text
                font.family: "Tahoma"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }

        }

        TextEdit {
            id: textEdit
            x: 543
            y: 635
            width: 161
            height: 58
            text: qsTr("Text Edit:多行输入")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12
            wrapMode: TextEdit.Wrap
            selectByMouse: true
            focus: true
            Text {
                id: text3
                x: 0
                y: 80
                width: 161
                height: 49
                color: "#df0974"
                text: textEdit.text
                font.family: "Verdana"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }

        }

        Rectangle {
            id: rectangle
            x: 1171
            y: 608
            width: 200
            height: 134
            color: "#ffffff"

            MouseArea {
                id: mouseArea
                x: 0
                y: 0
                width: 200
                height: 136
                hoverEnabled: true
                onPressed: {parent.color='red'}
                onReleased: {parent.color='#ffffff'}
            }
        }

        Rectangle {
            id: rectangle1
            x: 101
            y: 0
            width: 1165
            height: 507
            color: "#f3b1f7"

            Flickable {
                id: flickable
                width: 1165
                height: 507
                contentHeight: image1.width
                contentWidth: image1.height
                clip: true

                Image {
                    id: image1
                    source: "../../../Pictures/壁纸/ta.jpg"
                }

            }
            //竖滚动条
            Rectangle
            {
                id: scrollbar_vertical
                anchors.right: flickable.right
                //当前可视区域的位置.为百分比值,0-1之间
                y: flickable.visibleArea.yPosition * flickable.height
                width: 10
                //当前可视区域的高度比例,为百分比值,0-1之间
                height: flickable.visibleArea.heightRatio * flickable.height
                color: "black"
                antialiasing: true
            }

            //横滚动条
            Rectangle
            {
                id: scrollbar_horizontal
                anchors.bottom: flickable.bottom
                //当前可视区域的位置.为百分比值,0-1之间
                x: flickable.visibleArea.xPosition * flickable.width
                height: 10
                //当前可视区域的宽度比例,为百分比值,0-1之间
                width: flickable.visibleArea.widthRatio * flickable.width
                color: "black"
            }
        }
    }
}
