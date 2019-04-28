import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Extras 1.4 as QQE

Component
{
    id:modelDelegate

    Row
    {
        anchors.left: parent.left
        anchors.right: parent.right
        height:50
        spacing: 2

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
            source: "commands.bmp"
            anchors.top: parent.top
            anchors.bottom: parent.bottom
        }

        Button{
            text: command
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
        }
    }
}
