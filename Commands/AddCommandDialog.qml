import QtQuick 2.0
import QtQuick.Controls 2.5



Dialog
{
    signal dialogAccepted(var commandName)

    title: qsTr("Add Command")
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    width: parent.width - 20
    height: parent.height - 40
    closePolicy: "CloseOnEscape" | "CloseOnPressOutside"
    modal: true
    standardButtons: Dialog.Save | Dialog.Cancel

    Row
    {
        id: picrow
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        Text {
            id: imgpathtext
            text: qsTr("Image path:")
        }

        TextEdit
        {
            id:imgpathedit
            height: 30
            anchors.right: parent.right
            anchors.left: imgpathtext.right
        }
    }

    Row
    {
        id:commandrow
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 50
        Text {
            id: commandnametext
            text: qsTr("Command name:")
        }

        TextEdit
        {
            id:commandedit
            height: 30
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: commandnametext.right
            anchors.leftMargin: 0
        }
    }

    onAccepted: {
        if (commandedit.text!="")
            dialogAccepted(commandedit.text)
    }

    onRejected: {
        console.log("close")
    }

    onOpened: {
        commandedit.text=""
        imgpathedit.text=""
    }
}
