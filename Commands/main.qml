import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5


Window {
    id: window
    visible: true
    width: 600
    height: 300
    title: qsTr("Hello World")

    AddCommandDialog
    {
        id:addDialog
        onDialogAccepted: Model.add(commandName)
    }

    ModelDelegate
    {
        id:delegate
    }

    Button{
        id: btn
        text: "Добавить"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        onClicked:
        {
            addDialog.open();
        }
    }

    Rectangle
    {
        id: rectborder
        height: 2
        color: "black"
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: btn.bottom
        anchors.topMargin: 0
    }

    ListView
    {
        id:listview
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: rectborder.bottom
        anchors.topMargin: 0
        model:Model
        delegate: delegate
    }
}
