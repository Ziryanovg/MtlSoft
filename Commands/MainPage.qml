import QtQuick 2.0
import QtQuick.Controls 2.5

Item {

    signal addBtnClicked

    function addNewCommand(commandName)
    {
        Model.add(commandName)
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
        onClicked:addBtnClicked()
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
        anchors.top: rectborder.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.topMargin: 0

        model:Model
        delegate: ModelDelegate{}
    }

}
