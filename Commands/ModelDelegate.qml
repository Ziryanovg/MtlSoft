import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Extras 1.4 as QQE

Rectangle
{
    id:modelDelegate
    height: 30
    width: parent.width
    border.color: "black"
    border.width: 1

    property var currentstatus

    Timer
    {
        id:timer
        interval: 500;
        onTriggered: {
            var rand = Math.random();

            if(rand>0.5)
                currentstatus.on = false;
            else
                currentstatus.color = "red"
        }

    }


    Image
    {
        id:image
        width: 30
        source: "commands.bmp"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    Button{
        text: command
        anchors.bottomMargin: 1
        anchors.topMargin: 1
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: image.right
        anchors.right: status.left
        onClicked:
        {
            currentstatus = status
            status.color = "green"
            status.on = true;
            timer.start();
        }
    }

    QQE.StatusIndicator
    {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        id:status
        width: 30
    }
}
