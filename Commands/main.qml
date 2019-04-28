import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5


Window {
    id: window
    visible: true
    width: 600
    height: 300
    title: qsTr("Hello World")




    SwipeView
    {
        id:swipeView
        anchors.fill: parent
        currentIndex: 0
        interactive: false

        Item {
            id: mainPage

            MainPage{
                id:mainPageComp
                anchors.fill: parent
                onAddBtnClicked: swipeView.currentIndex = 1
            }
        }

        Item {
            id: addCommandView

            AddCommandPage
            {
                id:addCommandComp
                anchors.fill: parent
                onAddBtnClicked:
                {
                    onCancelBtnClicked: swipeView.currentIndex = 0
                    mainPageComp.addNewCommand(commandName)
                }

                onCancelBtnClicked: swipeView.currentIndex = 0
            }

        }

    }

}
