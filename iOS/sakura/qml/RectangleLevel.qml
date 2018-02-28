import QtQuick 2.9

Rectangle {
    id: rectangleLevel
    property int currentLocation: 0
    property int currentCampaign: 0
    property int currentLevel: 0
    property int ratingLevel: 0
    property bool isAvailable: false
    property string sourceImgLattern: ""

    function changeImgRatingLevel() {
        if (ratingLevel === 0) {
            firstStarImage.visible = false
            secondStarImage.visible = false
            thirdStarImage.visible = false
        } else if (ratingLevel === 1) {
            firstStarImage.visible = true
            secondStarImage.visible = false
            thirdStarImage.visible = false
        } else if (ratingLevel === 2) {
            firstStarImage.visible = true
            secondStarImage.visible = true
            thirdStarImage.visible = false
        } else if (ratingLevel === 3) {
            firstStarImage.visible = true
            secondStarImage.visible = true
            thirdStarImage.visible = true
        }
    }

    Row {
        id: buttonImageRow
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        z: 15
        height: 10
        spacing: 1

        Image {
            id: firstStarImage
            width: 10
            height: 10
            source: "qrc:/resources/images/star.png"
        }
        Image {
            id: secondStarImage
            width: 10
            height: 10
            source: "qrc:/resources/images/star.png"
        }
        Image {
            id: thirdStarImage
            width: 10
            height: 10
            source: "qrc:/resources/images/star.png"
        }
    }
    Image {
        id: latternImage
        width: 50
        height: 50
        anchors.top: buttonImageRow.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        source: rectangleLevel.sourceImgLattern

        Text {
            id: textName
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            text: (currentLevel + 1).toString()
            font.pointSize: 18
            font.bold: true
            color: "black"
            font.family: "Helvetica"
        }
    }
    MouseArea {
        anchors.fill: parent

        onClicked: {
            if (isAvailable) {
                var component = Qt.createComponent("CampaignPage.qml")

                if (component.status === Component.Ready) {
                    mainStackView.push(component, {
                                           currentLevel: currentLevel,
                                           currentLocation: currentLocation,
                                           currentCampaign: currentCampaign
                                       })
                } else {
                    console.log(component.errorString())
                }
            }
        }
    }
}
