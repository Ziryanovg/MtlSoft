import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    id: element

    signal addBtnClicked(var commandName)
    signal cancelBtnClicked()

    Text {
        id: textNewCommand
        width: 110
        text: qsTr("New Command")
        font.pointSize: 12
        anchors.horizontalCenter: parent.horizontalCenter
        wrapMode: Text.NoWrap
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    Text {
        id: textImgPath
        text: "Image Path:"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: textNewCommand.bottom
        anchors.topMargin: 20
    }

    Text {
        id: textCommandName
        text: "Command Name:"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: textImgPath.bottom
        anchors.topMargin: 10
    }

    Rectangle
    {
        id:rectImgpath
        height: 15
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: textImgPath.right
        anchors.leftMargin: 24
        anchors.verticalCenter: textImgPath.verticalCenter
        border.color: "black"
        border.width: 1

        TextEdit
        {
            id:editImgPath
            anchors.leftMargin: 5
            anchors.bottomMargin: 0
            anchors.fill: parent
        }
    }

    Rectangle
    {
        id:rectCommandName
        height: 15
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: textCommandName.right
        anchors.leftMargin: 0
        anchors.verticalCenter: textCommandName.verticalCenter
        border.color: "black"
        border.width: 1

        TextEdit
        {
            id:editCommandName
            anchors.leftMargin: 5
            anchors.bottomMargin: 0
            anchors.fill: parent
        }
    }



    Button
    {
        id:btnAdd
        text: "Add"
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: btnCancel.top
        onClicked:
        {
            addBtnClicked(editCommandName.text)
            clearInput()
        }
    }

    Button
    {
        id:btnCancel
        text: "Cancel"
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        onClicked:
        {
            cancelBtnClicked()
            clearInput()
        }
    }

    function clearInput()
    {
        editImgPath.text = ""
        editCommandName.text = ""
    }
}
