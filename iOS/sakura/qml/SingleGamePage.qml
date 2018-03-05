import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Particles 2.0
import QtMultimedia 5.9

import "GenerationBranch.js" as GenerationBranchScript

Item {
    id: singleGamePage
    property int currentLevel: 0
    property var arrRectTrasparent: []
    property int countSecondsTimeStop: 0
    property int countStepStop: 0
    property int countBlockTimeLevel: 0
    property int countBlockStepLevel: 0
    property int countQuickTipLevel: 0
    property var arrBranchRotation: []
    property int isLockedQuickTip: 0
    property real lastMouseX: 0
    property real lastMouseY: 0
    property int countPetalsMax: 250
    property int countPetalsMin: 10
    property int countPetals: 10

    property int emitRatePetalsMax: 70
    property int emitRatePetalsMin: 2
    property int emitRatePetals: 2

    property int bannerViewHeight: AdMobHelper.bannerViewHeight
    property bool isPushStore: false
    property bool isTimerGameRunning: false
    property bool isTimerBlockTimeGame: false

    Image {
        id: imageBackgroundMainLevel
        source: "qrc:/resources/images/background_main.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop

        ParticleSystem {
            id: particleSystem1
            running: false
        }

        Emitter {
            anchors.fill: parent
            system: particleSystem1
            lifeSpan: 5000
            size: 16
            emitRate: singleGamePage.emitRatePetals
            maximumEmitted: singleGamePage.countPetals

            velocity: AngleDirection {
                angle: 90.0
                angleVariation: 50
                magnitude: 80.0
                magnitudeVariation: 20
            }

            ImageParticle {
                rotationVelocity: 30.0
                rotationVariation: 10.0
                opacity: 0.75
                system: particleSystem1
                source: "qrc:/resources/images/petal_big_2.png"
            }
        }

        ParticleSystem {
            id: particleSystem2
            running: false
        }

        Emitter {
            anchors.fill: parent
            system: particleSystem2
            lifeSpan: 5000
            size: 8
            emitRate: singleGamePage.emitRatePetals
            maximumEmitted: singleGamePage.countPetals

            velocity: AngleDirection {
                angle: 90.0
                angleVariation: 30
                magnitude: 30.0
                magnitudeVariation: 10
            }

            ImageParticle {
                rotationVelocity: 30.0
                rotationVariation: 10.0
                opacity: 0.75
                system: particleSystem2
                source: "qrc:/resources/images/petal_small_1.png"
            }
        }

        Row {
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

            Image {
                id: imageLanternScore
                source: "qrc:/resources/images/lantern_score.png"
                width: 70
                height: 161
                y: imageLanternScore.height * -1

                Column {
                    spacing: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 30

                    Rectangle {
                        height: 12
                        width: 50
                        color: "transparent"
                        Text {
                            id: textScoreLantern
                            anchors.centerIn: parent
                            text: qsTr("SCORE:")
                            font.pointSize: 12
                            font.bold: true
                            color: "black"
                            font.family: "Helvetica"
                        }
                    }

                    Rectangle {
                        height: 18
                        width: 50
                        color: "transparent"

                        Text {
                            id: textScoreGameLantern
                            anchors.centerIn: parent
                            text: "0"
                            font.pointSize: 18
                            font.bold: true
                            color: "black"
                            font.family: "Helvetica"
                        }
                    }
                }

                PropertyAnimation {
                    id: animationScoreDown
                    duration: 1400
                    easing.overshoot: 2.5
                    from: imageLanternScore.height * -1
                    target: imageLanternScore
                    properties: "y"
                    easing.type: Easing.OutBack
                    to: -40
                }

                PropertyAnimation {
                    id: animationScoreUp
                    duration: 300
                    from: imageLanternScore.y
                    target: imageLanternScore
                    properties: "y"
                    easing.type: Easing.InQuad
                    to: imageLanternScore.height * -1
                    onStopped: {
                        textScoreGameLantern.text = GenerationBranchScript.listObjectSingleLevels[currentLevel].currentScore
                        animationScoreDown.start()
                    }
                }
            }

            Image {
                id: imageLanternStep
                source: "qrc:/resources/images/lantern_step.png"
                width: 70
                height: 161
                y: imageLanternStep.height * -1

                Column {
                    spacing: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 30

                    Rectangle {
                        height: 12
                        width: 50
                        color: "transparent"
                        Text {
                            id: textStepLantern
                            anchors.centerIn: parent
                            text: qsTr("STEP:")
                            font.pointSize: 12
                            font.bold: true
                            color: "black"
                            font.family: "Helvetica"
                        }
                    }

                    Rectangle {
                        height: 18
                        width: 50
                        color: "transparent"

                        Text {
                            id: textStepGameLantern
                            anchors.centerIn: parent
                            text: "0"
                            font.pointSize: 18
                            font.bold: true
                            color: "black"
                            font.family: "Helvetica"
                        }
                    }
                    Rectangle {
                        id: rectStepStopLantern
                        height: 20
                        width: 50
                        color: "transparent"
                        visible: false
                        Text {
                            id: textStepStopLantern
                            anchors.centerIn: parent
                            text: ""
                            font.pointSize: 20
                            font.bold: true
                            color: "black"
                            font.family: "Helvetica"
                        }
                    }
                }

                PropertyAnimation {
                    id: animationStepDown
                    duration: 1000
                    easing.overshoot: 1.5
                    from: imageLanternStep.height * -1
                    target: imageLanternStep
                    properties: "y"
                    easing.type: Easing.OutBack
                    to: -35
                }

                PropertyAnimation {
                    id: animationStepUp
                    duration: 300
                    from: imageLanternStep.y
                    target: imageLanternStep
                    properties: "y"
                    easing.type: Easing.InQuad
                    to: imageLanternStep.height * -1
                    onStopped: {
                        textStepGameLantern.text = 0
                        animationStepDown.start()
                    }
                }
            }

            Image {
                id: imageLanternTime
                width: 70
                height: 161
                source: "qrc:/resources/images/lantern_time.png"
                y: imageLanternTime.height * -1

                Column {
                    spacing: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 30

                    Rectangle {
                        height: 12
                        width: 50
                        color: "transparent"
                        Text {
                            id: textTimeLantern
                            anchors.centerIn: parent
                            text: qsTr("TIME:")
                            font.pointSize: 12
                            font.bold: true
                            color: "black"
                            font.family: "Helvetica"
                        }
                    }

                    Rectangle {
                        height: 18
                        width: 50
                        color: "transparent"

                        Text {
                            id: textTimeGameLantern
                            anchors.centerIn: parent
                            text: "0"
                            font.pointSize: 18
                            font.bold: true
                            color: "black"
                            font.family: "Helvetica"
                        }
                    }
                    Rectangle {
                        id: rectTimeStopLantern
                        height: 20
                        width: 50
                        color: "transparent"
                        visible: false
                        Text {
                            id: textTimeStopLantern
                            anchors.centerIn: parent
                            text: ""
                            font.pointSize: 20
                            font.bold: true
                            color: "black"
                            font.family: "Helvetica"
                        }
                    }
                }

                PropertyAnimation {
                    id: animationTimeDown
                    duration: 500
                    easing.overshoot: 2.5
                    from: imageLanternTime.height * -1
                    target: imageLanternTime
                    properties: "y"
                    easing.type: Easing.OutBack
                    to: -40
                    onStopped: {
                        timerGame.start()
                    }
                }

                PropertyAnimation {
                    id: animationTimeUp
                    duration: 300
                    from: imageLanternTime.y
                    target: imageLanternTime
                    properties: "y"
                    easing.type: Easing.InQuad
                    to: imageLanternTime.height * -1
                    onStopped: {
                        textTimeGameLantern.text = 0
                        animationTimeDown.start()
                    }
                }
            }
        }

        Flickable {
            id: backgroundFlickable
            boundsBehavior: Flickable.StopAtBounds
            anchors.centerIn: parent
            width: parent.width
            height: width - 32
            clip: true

            property real initialContentWidth: 0.0
            property real initialContentHeight: 0.0

            function initialResize(grid_width, grid_height) {
                if (grid_width > 0.0 && grid_height > 0.0) {
                    var scale = 1.0

                    if (grid_width > grid_height) {
                        scale = (width / grid_width)
                    } else {
                        scale = (height / grid_height)
                    }

                    if (scale < 0.25) {
                        scale = 0.25
                    }
                    if (scale > 3.0) {
                        scale = 3.0
                    }

                    resizeContent(initialContentWidth * scale,
                                  initialContentHeight * scale,
                                  Qt.point(contentWidth / 2, contentHeight / 2))

                    contentX = (contentWidth - width) / 2
                    contentY = (contentHeight - height) / 2

                    returnToBounds()
                }
            }

            PinchArea {
                id: pinchAreaZoom
                anchors.fill: parent

                Rectangle {
                    width: Math.max(gridMapSingleGame.width,
                                    backgroundFlickable.width) * 2
                    height: Math.max(gridMapSingleGame.height,
                                     backgroundFlickable.height) * 2
                    scale: backgroundFlickable.initialContentWidth > 0.0
                           && backgroundFlickable.contentWidth
                           > 0.0 ? backgroundFlickable.contentWidth
                                   / backgroundFlickable.initialContentWidth : 1.0
                    transformOrigin: Item.TopLeft
                    color: "transparent"

                    onWidthChanged: {
                        backgroundFlickable.initialContentWidth = width

                        backgroundFlickable.initialResize(
                                    gridMapSingleGame.width,
                                    gridMapSingleGame.height)
                    }

                    onHeightChanged: {
                        backgroundFlickable.initialContentHeight = height

                        backgroundFlickable.initialResize(
                                    gridMapSingleGame.width,
                                    gridMapSingleGame.height)
                    }

                    Grid {
                        id: gridMapSingleGame
                        anchors.centerIn: parent
                        spacing: 1

                        onWidthChanged: {
                            backgroundFlickable.initialResize(
                                        gridMapSingleGame.width,
                                        gridMapSingleGame.height)
                        }

                        onHeightChanged: {
                            backgroundFlickable.initialResize(
                                        gridMapSingleGame.width,
                                        gridMapSingleGame.height)
                        }
                    }

                    MouseArea {
                        id: mouseAreaRectBranch
                        anchors.fill: parent
                        propagateComposedEvents: true

                        onClicked: {
                            lastMouseX = mouse.x
                            lastMouseY = mouse.y

                            mouse.accepted = false
                        }

                        onDoubleClicked: {

                            if (Math.abs(mouse.x - lastMouseX) * scale < 16
                                    && Math.abs(
                                        mouse.y - lastMouseY) * scale < 16) {
                                backgroundFlickable.initialResize(
                                            gridMapSingleGame.width,
                                            gridMapSingleGame.height)
                            }
                        }
                    }
                }

                onPinchStarted: {
                    backgroundFlickable.interactive = false
                }

                onPinchUpdated: {
                    backgroundFlickable.contentX += pinch.previousCenter.x - pinch.center.x
                    backgroundFlickable.contentY += pinch.previousCenter.y - pinch.center.y

                    var scale = 1.0 + pinch.scale - pinch.previousScale

                    if (backgroundFlickable.contentWidth * scale
                            / backgroundFlickable.initialContentWidth >= 0.25
                            && backgroundFlickable.contentWidth * scale
                            / backgroundFlickable.initialContentWidth <= 3.0) {
                        backgroundFlickable.resizeContent(
                                    backgroundFlickable.contentWidth * scale,
                                    backgroundFlickable.contentHeight * scale,
                                    pinch.center)
                    }
                }

                onPinchFinished: {
                    backgroundFlickable.interactive = true
                    backgroundFlickable.returnToBounds()
                }
            }

            Component.onCompleted: {
                contentWidth = width
                contentHeight = height
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Math.max(singleGamePage.bannerViewHeight + 8,
                                           20)
            spacing: 15
            Image {
                id: backButton
                anchors.bottom: parent.bottom
                source: "qrc:/resources/images/back.png"
                width: 50
                height: 50
                MouseArea {
                    id: mouseAreaBackButton
                    anchors.fill: parent
                    onClicked: {
                        mainStackView.pop()
                    }
                }
            }

            Column {
                Rectangle {
                    width: 50
                    height: 20
                    color: "transparent"
                    Rectangle {
                        anchors.centerIn: parent
                        width: 50
                        height: 20
                        color: "black"
                        opacity: 0.3
                        radius: 10
                    }
                    Text {
                        id: textCountBlockStepLantern
                        anchors.centerIn: parent
                        text: "0"
                        font.pointSize: 16
                        font.bold: true
                        color: "white"
                        opacity: 1.0
                        font.family: "Helvetica"
                    }
                }
                Image {
                    id: iceStepButton
                    source: "qrc:/resources/images/lantern_step_ice_booster.png"
                    width: 50
                    height: 50

                    MouseArea {
                        id: mouseAreaIceStepButton
                        anchors.fill: parent
                        onClicked: {
                            if (Number(mainWindow.getSetting(
                                           "countBlockStepLantern", 0)) <= 0) {
                                if (timerGame.running) {
                                    timerGame.running = false
                                    isTimerGameRunning = true
                                }
                                if (timerBlockTimeGame.running) {
                                    timerBlockTimeGame.running = false
                                    isTimerBlockTimeGame = true
                                }
                                isPushStore = true
                                mainStackView.push(storePage)
                                return
                            }

                            if (timerBlockTimeGame.running !== true
                                    && countStepStop === 0) {
                                setBlockStep()
                            }
                        }
                    }
                }
            }
            Column {
                Rectangle {
                    width: 50
                    height: 20
                    color: "transparent"
                    Rectangle {
                        anchors.centerIn: parent
                        width: 50
                        height: 20
                        color: "black"
                        opacity: 0.3
                        radius: 10
                    }
                    Text {
                        id: textCountBlockTimeLantern
                        anchors.centerIn: parent
                        text: "0"
                        font.pointSize: 16
                        font.bold: true
                        color: "white"
                        opacity: 1.0
                        font.family: "Helvetica"
                    }
                }
                Image {
                    id: iceTimeButton
                    source: "qrc:/resources/images/lantern_time_ice_booster.png"
                    width: 50
                    height: 50
                    MouseArea {
                        id: mouseAreaIceTimeButton
                        anchors.fill: parent
                        onClicked: {
                            if (Number(mainWindow.getSetting(
                                           "countBlockTimeLantern", 0)) <= 0) {
                                if (timerGame.running) {
                                    timerGame.running = false
                                    isTimerGameRunning = true
                                }
                                if (timerBlockTimeGame.running) {
                                    timerBlockTimeGame.running = false
                                    isTimerBlockTimeGame = true
                                }
                                isPushStore = true
                                mainStackView.push(storePage)
                                return
                            }

                            if (timerBlockTimeGame.running !== true
                                    && countStepStop === 0) {
                                setBlockTime()
                            }
                        }
                    }
                }
            }
            Column {
                Rectangle {
                    width: 50
                    height: 20
                    color: "transparent"
                    Rectangle {
                        anchors.centerIn: parent
                        width: 50
                        height: 20
                        color: "black"
                        opacity: 0.3
                        radius: 10
                    }
                    Text {
                        id: textCountQuickTipButton
                        anchors.centerIn: parent
                        text: "0"
                        font.pointSize: 16
                        font.bold: true
                        color: "white"
                        opacity: 1.0
                        font.family: "Helvetica"
                    }
                }
                Image {
                    id: quickTipButton
                    source: "qrc:/resources/images/button_quick_tip.png"
                    width: 50
                    height: 50

                    MouseArea {
                        id: mouseAreaQuickTipButton
                        anchors.fill: parent
                        onClicked: {
                            if (Number(mainWindow.getSetting("countQuickTip",
                                                             0)) <= 0) {
                                if (timerGame.running) {
                                    timerGame.running = false
                                    isTimerGameRunning = true
                                }
                                if (timerBlockTimeGame.running) {
                                    timerBlockTimeGame.running = false
                                    isTimerBlockTimeGame = true
                                }
                                isPushStore = true
                                mainStackView.push(storePage)
                                return
                            }
                            setQuickTip()
                        }
                    }
                }
            }

            Image {
                id: refreshButton
                anchors.bottom: parent.bottom
                source: "qrc:/resources/images/refresh.png"
                width: 50
                height: 50
                MouseArea {
                    id: mouseAreaRefreshButton
                    anchors.fill: parent
                    onClicked: {
                        repeatGame()
                    }
                }
            }
        }

        BusyIndicator {
            id: busyIndicatorRatingSet
            anchors.centerIn: parent
            running: false
            visible: false
        }
    }

    Rectangle {
        id: rectCompletedGame
        anchors.horizontalCenter: parent.horizontalCenter
        y: imageBackgroundMainLevel.height
        width: 300
        height: 200
        color: "transparent"
        Image {
            id: backgroundCompletedGame
            source: "qrc:/resources/images/background_rect_score.png"
            width: parent.width
            height: parent.height

            Row {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 30
                z: 15
                spacing: 20
                Column {
                    id: rowTextCompletedGame
                    z: 15
                    spacing: 5
                    visible: true
                    Text {
                        id: textScoreGame
                        anchors.horizontalCenter: parent.horizontalCenter

                        text: qsTr("SCORE: ")
                        font.pointSize: 20
                        font.bold: true
                        color: "white"
                        font.family: "Helvetica"
                    }
                    Text {
                        id: textScoreCurrentGame
                        anchors.horizontalCenter: parent.horizontalCenter

                        text: ""
                        font.pointSize: 40
                        font.bold: true
                        color: "white"
                        font.family: "Helvetica"
                    }
                }

                Column {
                    id: rowTextAvardGame
                    z: 15
                    spacing: 5
                    visible: false
                    Text {
                        id: textAvardPlace
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: ""
                        font.pointSize: 20
                        font.bold: true
                        color: "white"
                        font.family: "Helvetica"
                    }
                    Image {
                        id: imageAvard
                        width: 40
                        height: 40
                        source: "qrc:/resources/images/button_award.png"
                    }
                }
            }

            Text {
                id: textFailedGame
                anchors.top: parent.top
                anchors.bottom: rowRectCompletedGame.top
                anchors.left: parent.left
                anchors.right: parent.right
                z: 15
                visible: false
                text: qsTr("Game over. Do you want to play again?")
                font.pointSize: 20
                font.bold: true
                color: "white"
                font.family: "Helvetica"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
            }

            Row {
                id: rowRectCompletedGame
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 30
                z: 15
                height: 50
                spacing: 15

                Image {
                    id: imageRepeatGame
                    width: 50
                    height: 50
                    source: "qrc:/resources/images/button_repeat_game.png"
                    MouseArea {
                        id: mouseAreaPlayRepeatGame
                        anchors.fill: parent
                        onClicked: {
                            repeatGame()
                        }
                    }
                }
                Image {
                    id: imageSeachLevel
                    width: 50
                    height: 50
                    source: "qrc:/resources/images/button_seach_levels.png"
                    MouseArea {
                        id: mouseAreaSeachLevel
                        anchors.fill: parent
                        onClicked: {
                            mainStackView.pop()
                            mainWindow.showInterstitial()
                        }
                    }
                }
                Image {
                    id: imageShare
                    width: 50
                    height: 50
                    source: "qrc:/resources/images/button_share.png"

                    MouseArea {
                        id: mouseAreaImageShare
                        anchors.fill: parent
                        onClicked: {
                            var component = Qt.createComponent("CardPage.qml")

                            if (component.status === Component.Ready) {
                                if (singleGamePage.countPetals === singleGamePage.countPetalsMax) {
                                    mainStackView.push(component, {
                                                           currentLevel: currentLevel,
                                                           isCampaign: 0,
                                                           listGameBranchObject: GenerationBranchScript.listGameBranchObject,
                                                           isMaxPetals: 1
                                                       })
                                } else {
                                    mainStackView.push(component, {
                                                           currentLevel: currentLevel,
                                                           isCampaign: 0,
                                                           listGameBranchObject: GenerationBranchScript.listGameBranchObject,
                                                           isMaxPetals: 0
                                                       })
                                }
                            } else {
                                console.log(component.errorString())
                            }
                            mainWindow.showInterstitial()
                        }
                    }
                }
            }
        }

        PropertyAnimation {
            id: animationRectCompletedGameUp
            duration: 500
            easing.overshoot: 4.5
            from: imageBackgroundMainLevel.height
            target: rectCompletedGame
            properties: "y"
            easing.type: Easing.InQuad
            to: imageBackgroundMainLevel.height - rectCompletedGame.height - Math.max(
                    singleGamePage.bannerViewHeight + 8, 20)
        }
        PropertyAnimation {
            id: animationRectCompletedGameDown
            duration: 200
            from: rectCompletedGame.y
            target: rectCompletedGame
            properties: "y"
            easing.type: Easing.InQuad
            to: imageBackgroundMainLevel.height
            onStopped: {
                textFailedGame.visible = false
                imageShare.visible = true
                rowTextCompletedGame.visible = true
                rowTextAvardGame.visible = false
            }
        }
    }

    StackView.onStatusChanged: {
        if (StackView.status === StackView.Active && isPushStore) {
            textCountBlockStepLantern.text = Number(
                        mainWindow.getSetting("countBlockStepLantern", 0))
            textCountBlockTimeLantern.text = Number(
                        mainWindow.getSetting("countBlockTimeLantern", 0))
            textCountQuickTipButton.text = Number(mainWindow.getSetting(
                                                      "countQuickTip", 0))
            isPushStore = false
            if (isTimerGameRunning) {
                timerGame.running = true
                isTimerGameRunning = false
            }
            if (isTimerBlockTimeGame) {
                timerBlockTimeGame.running = true
                isTimerBlockTimeGame = false
            }
            return
        }

        if (StackView.status === StackView.Active
                && rectCompletedGame.y === imageBackgroundMainLevel.height) {
            busyIndicatorRatingSet.running = false
            busyIndicatorRatingSet.visible = false
            mixMap()
            textStepGameLantern.text
                    = GenerationBranchScript.listObjectSingleLevels[currentLevel].currentStep
            animationStepDown.running = true

            textTimeGameLantern.text
                    = GenerationBranchScript.listObjectSingleLevels[currentLevel].currentTime
            animationTimeDown.running = true

            textScoreGameLantern.text
                    = GenerationBranchScript.listObjectSingleLevels[currentLevel].currentScore
            animationScoreDown.running = true

            textFailedGame.visible = false
            imageShare.visible = true
        }
    }

    Timer {
        id: timerGame
        interval: 1000
        repeat: true
        onTriggered: singleGamePage.timerGame()
    }

    Timer {
        id: timerBlockTimeGame
        interval: 1000
        repeat: true
        onTriggered: singleGamePage.timerBlockTime()
    }

    Audio {
        id: audioClickBranch
        volume: 1.0
        source: "qrc:/resources/sound/click.wav"
        loops: 0
        onError: {
            console.log(errorString)
        }
    }

    Audio {
        id: audioGoodGame
        volume: 1.0
        source: "qrc:/resources/sound/game_complete.wav"
        loops: 0
        onError: {
            console.log(errorString)
        }
    }

    Audio {
        id: audioGameOver
        volume: 1.0
        source: "qrc:/resources/sound/game_over.wav"
        loops: 0
        onError: {
            console.log(errorString)
        }
    }

    Component.onCompleted: {
        textCountBlockStepLantern.text = Number(mainWindow.getSetting(
                                                    "countBlockStepLantern", 0))
        textCountBlockTimeLantern.text = Number(mainWindow.getSetting(
                                                    "countBlockTimeLantern", 0))
        textCountQuickTipButton.text = Number(mainWindow.getSetting(
                                                  "countQuickTip", 0))
        loadBranchOnMap()
    }

    function resetParticleSystems() {
        particleSystem1.running = true
        particleSystem2.running = true
        particleSystem1.reset()
        particleSystem2.reset()
    }

    function setQuickTip() {
        if (GenerationBranchScript.isCompleted === 1)
            return
        if (countQuickTipLevel
                >= GenerationBranchScript.listObjectSingleLevels[currentLevel].countQuickTip)
            return
        var countQuickTipLantern = Number(mainWindow.getSetting(
                                              "countQuickTip", 0))
        if (countQuickTipLantern <= 0)
            return

        for (var i = 0; i < GenerationBranchScript.heightGame; i++) {
            for (var j = 0; j < GenerationBranchScript.widthGame; j++) {
                if (GenerationBranchScript.listGameBranchObject[i][j] !== null) {
                    if (GenerationBranchScript.listGameBranchObject[i][j].rotationBranch
                            != GenerationBranchScript.listGameBranch[i][j].rotation) {
                        if (GenerationBranchScript.listGameBranchObject[i][j].nameItem
                                == 'branch_05')
                            continue
                        if (GenerationBranchScript.listGameBranchObject[i][j].nameItem
                                == 'branch_01'
                                && ((GenerationBranchScript.listGameBranchObject[i][j].rotationBranch === 0
                                     && GenerationBranchScript.listGameBranch[i][j].rotation
                                     === 180)
                                    || (GenerationBranchScript.listGameBranchObject[i][j].rotation
                                        === 90
                                        && GenerationBranchScript.listGameBranch[i][j].rotation
                                        === 270))) {
                            continue
                        } else if (GenerationBranchScript.listGameBranchObject[i][j].nameItem
                                   == 'branch_01'
                                   && ((GenerationBranchScript.listGameBranchObject[i][j].rotationBranch === 180
                                        && GenerationBranchScript.listGameBranch[i][j].rotation
                                        === 0)
                                       || (GenerationBranchScript.listGameBranchObject[i][j].rotation === 270
                                           && GenerationBranchScript.listGameBranch[i][j].rotation
                                           === 90))) {
                            continue
                        }
                        if (isLockedQuickTip == 1)
                            return
                        isLockedQuickTip = 1
                        setInfoQuickTip()

                        GenerationBranchScript.listGameBranchObject[i][j].startAnimationQuickTip()

                        if (GenerationBranchScript.listGameBranch[i][j].rotation == 0) {
                            GenerationBranchScript.listGameBranchObject[i][j].toRotationBranch = 360
                        } else {
                            GenerationBranchScript.listGameBranchObject[i][j].toRotationBranch
                                    = GenerationBranchScript.listGameBranch[i][j].rotation
                        }
                        GenerationBranchScript.listGameBranchObject[i][j].fromRotationBranch
                                = GenerationBranchScript.listGameBranchObject[i][j].rotationBranch
                        GenerationBranchScript.listGameBranchObject[i][j].startAnimationRotationGame()
                        audioClickBranch.play()

                        GenerationBranchScript.listGameBranchObject[i][j].posLeft
                                = GenerationBranchScript.listGameBranch[i][j].left
                        GenerationBranchScript.listGameBranchObject[i][j].posRight
                                = GenerationBranchScript.listGameBranch[i][j].right
                        GenerationBranchScript.listGameBranchObject[i][j].posTop
                                = GenerationBranchScript.listGameBranch[i][j].top
                        GenerationBranchScript.listGameBranchObject[i][j].posBottom
                                = GenerationBranchScript.listGameBranch[i][j].bottom

                        if (setScoreUserRotation(
                                    GenerationBranchScript.listGameBranchObject[i][j].score)
                                === false)
                            return
                        return
                    }
                }
            }
        }
    }

    function setInfoQuickTip() {
        var countQuickTip = Number(mainWindow.getSetting("countQuickTip", 0))
        countQuickTip--
        countQuickTipLevel++
        mainWindow.setSetting("countQuickTip", countQuickTip)
        textCountQuickTipButton.text = countQuickTip
        if (countQuickTipLevel
                >= GenerationBranchScript.listObjectSingleLevels[currentLevel].countQuickTip) {
            quickTipButton.source = "qrc:/resources/images/button_quick_tip_locked.png"
        } else {
            quickTipButton.source = "qrc:/resources/images/button_quick_tip.png"
        }
    }

    function timerBlockTime() {
        if (GenerationBranchScript.isCompleted === 1)
            return
        countSecondsTimeStop--
        textTimeStopLantern.text = countSecondsTimeStop
        if (countSecondsTimeStop === 0) {
            timerBlockTimeGame.stop()
            imageLanternTime.source = "qrc:/resources/images/lantern_time.png"
            if (countBlockStepLevel
                    < GenerationBranchScript.listObjectSingleLevels[currentLevel].countBlockStep) {
                iceStepButton.source = "qrc:/resources/images/lantern_step_ice_booster.png"
            }

            if (countBlockTimeLevel
                    >= GenerationBranchScript.listObjectSingleLevels[currentLevel].countBlockTime) {
                iceTimeButton.source = "qrc:/resources/images/lantern_time_locked.png"
            } else {
                iceTimeButton.source = "qrc:/resources/images/lantern_time_ice_booster.png"
            }

            textTimeLantern.visible = true
            textTimeGameLantern.visible = true
            rectTimeStopLantern.visible = false
            timerGame.start()
        }
    }

    function setBlockStep() {
        if (GenerationBranchScript.isCompleted === 1)
            return
        if (countBlockStepLevel
                >= GenerationBranchScript.listObjectSingleLevels[currentLevel].countBlockStep)
            return
        var countBlockStepLantern = Number(mainWindow.getSetting(
                                               "countBlockStepLantern", 0))
        if (countBlockStepLantern > 0) {
            countBlockStepLantern--
            countBlockStepLevel++
            mainWindow.setSetting("countBlockStepLantern",
                                  countBlockStepLantern)
            textCountBlockStepLantern.text = countBlockStepLantern
            textStepLantern.visible = false
            textStepGameLantern.visible = false
            imageLanternStep.source = "qrc:/resources/images/lantern_step_ice.png"
            if (countBlockTimeLevel
                    < GenerationBranchScript.listObjectSingleLevels[currentLevel].countBlockTime) {
                iceTimeButton.source = "qrc:/resources/images/lantern_time_disabled.png"
            }
            iceStepButton.source = "qrc:/resources/images/lantern_step_disabled.png"
            rectStepStopLantern.visible = true
            countStepStop = GenerationBranchScript.COUNT_STEP_STOP
            textStepStopLantern.text = countStepStop
        }
    }

    function setBlockTime() {
        if (countBlockTimeLevel
                >= GenerationBranchScript.listObjectSingleLevels[currentLevel].countBlockTime)
            return
        var countBlockTimeLantern = Number(mainWindow.getSetting(
                                               "countBlockTimeLantern", 0))
        if (countBlockTimeLantern > 0) {
            countBlockTimeLantern--
            countBlockTimeLevel++
            mainWindow.setSetting("countBlockTimeLantern",
                                  countBlockTimeLantern)
            textCountBlockTimeLantern.text = countBlockTimeLantern
            timerGame.stop()
            textTimeLantern.visible = false
            textTimeGameLantern.visible = false
            imageLanternTime.source = "qrc:/resources/images/lantern_time_ice.png"
            iceTimeButton.source = "qrc:/resources/images/lantern_time_disabled.png"
            if (countBlockStepLevel
                    < GenerationBranchScript.listObjectSingleLevels[currentLevel].countBlockStep) {
                iceStepButton.source = "qrc:/resources/images/lantern_step_disabled.png"
            }
            rectTimeStopLantern.visible = true
            countSecondsTimeStop = 10
            textTimeStopLantern.text = countSecondsTimeStop
            timerBlockTimeGame.start()
        }
    }

    function repeatGame() {
        busyIndicatorRatingSet.running = false
        busyIndicatorRatingSet.visible = false
        countBlockTimeLevel = 0
        countBlockStepLevel = 0
        countQuickTipLevel = 0
        imageLanternTime.source = "qrc:/resources/images/lantern_time.png"
        iceTimeButton.source = "qrc:/resources/images/lantern_time_ice_booster.png"
        iceStepButton.source = "qrc:/resources/images/lantern_step_ice_booster.png"
        quickTipButton.source = "qrc:/resources/images/button_quick_tip.png"

        textTimeLantern.visible = true
        textTimeGameLantern.visible = true
        rectTimeStopLantern.visible = false
        timerBlockTimeGame.stop()

        countStepStop = 0
        imageLanternStep.source = "qrc:/resources/images/lantern_step.png"
        textStepLantern.visible = true
        textStepGameLantern.visible = true
        rectStepStopLantern.visible = false

        animationRectCompletedGameDown.running = true
        timerGame.stop()

        loadBranchOnMap()
        mixMap()
        animationScoreDown.running = false
        animationScoreUp.running = true

        animationStepDown.running = false
        animationStepUp.running = true

        animationTimeDown.running = false
        animationTimeUp.running = true
    }

    function visibleFailedGameWindow() {
        audioGameOver.play()
        textFailedGame.visible = true
        imageShare.visible = false
        rowTextCompletedGame.visible = false
        GenerationBranchScript.isCompleted = 1
        animationRectCompletedGameUp.running = true
        if (timerGame.running === true)
            timerGame.stop()
        if (timerBlockTimeGame.running === true)
            timerBlockTimeGame.stop()
    }

    function timerGame() {

        GenerationBranchScript.listObjectSingleLevels[currentLevel].currentTime++
        textTimeGameLantern.text
                = GenerationBranchScript.listObjectSingleLevels[currentLevel].currentTime
        var score = GenerationBranchScript.listObjectSingleLevels[currentLevel].currentScore
                - GenerationBranchScript.SCORE_TIME_BRANCH
        GenerationBranchScript.listObjectSingleLevels[currentLevel].currentScore
                = score > 0 ? score : 0
        textScoreGameLantern.text
                = GenerationBranchScript.listObjectSingleLevels[currentLevel].currentScore

        if (score <= 0) {
            visibleFailedGameWindow()
            if (timerGame.running === true)
                timerGame.stop()
        }
    }

    function loadBranchOnMap() {
        GenerationBranchScript.initObjectSingleLevels()
        var objMap = GenerationBranchScript.listObjectSingleLevels[currentLevel]
        var widthGame = objMap.width
        var heightGame = objMap.height
        isLockedQuickTip = 0
        textLevel.text = widthGame + "x" + heightGame
        if (objMap.map.length === 0) {
            for (var i = 0; i < objMap.height; i++) {
                for (var j = 0; j < objMap.width; j++) {
                    objMap.map[objMap.map.length] = 1
                }
            }
        }

        if (GenerationBranchScript.listGameBranchObject.length !== 0) {
            for (var keyI in GenerationBranchScript.listGameBranchObject) {
                if (GenerationBranchScript.listGameBranchObject[keyI].length !== 0) {
                    for (var keyJ in GenerationBranchScript.listGameBranchObject[keyI]) {
                        if (GenerationBranchScript.listGameBranchObject[keyI][keyJ] !== null)
                            GenerationBranchScript.listGameBranchObject[keyI][keyJ].destroy()
                    }
                }
            }
        }

        GenerationBranchScript.listGameBranch = []

        GenerationBranchScript.listGameBranchObject = []
        for (var i = 0; i < heightGame; i++) {
            GenerationBranchScript.listGameBranchObject[i] = []
            for (var j = 0; j < widthGame; j++) {
                GenerationBranchScript.listGameBranchObject[i][j] = null
            }
        }

        if (arrRectTrasparent.length > 0) {
            for (var key in arrRectTrasparent) {
                arrRectTrasparent[key].destroy()
            }
        }
        arrRectTrasparent = []

        GenerationBranchScript.createBranchForMap(objMap)

        var component
        var object
        gridMapSingleGame.columns = 0
        gridMapSingleGame.columns = widthGame
        GenerationBranchScript.isPlayGame = 1
        GenerationBranchScript.isCompleted = 0
        gridMapSingleGame.spacing = 1

        for (var i = 0; i < heightGame; i++) {
            for (var j = 0; j < widthGame; j++) {
                if (objMap.mapArray[i][j] === 1) {
                    component = Qt.createComponent("Branch.qml")
                    object = component.createObject(gridMapSingleGame)
                    object.source = GenerationBranchScript.listGameBranch[i][j].source
                    object.rotationBranch = GenerationBranchScript.listGameBranch[i][j].rotation
                    object.posLeft = GenerationBranchScript.listGameBranch[i][j].left
                    object.posRight = GenerationBranchScript.listGameBranch[i][j].right
                    object.posTop = GenerationBranchScript.listGameBranch[i][j].top
                    object.posBottom = GenerationBranchScript.listGameBranch[i][j].bottom
                    object.nameItem = GenerationBranchScript.listGameBranch[i][j].name
                    object.score = GenerationBranchScript.listGameBranch[i][j].score
                    object.typeItem = 1
                    object.typeAnimation = 1
                    object.posI = i
                    object.posJ = j
                    object.stopRotation = 0
                    object.onStopRotationTime.connect(stopRotationBranch)
                    object.onStopRotationTimeGame.connect(
                                stopRotationBranchGame)
                    object.onClickedBranch.connect(rotationBranch)
                    GenerationBranchScript.listGameBranchObject[i][j] = object
                } else {
                    component = Qt.createQmlObject(
                                'import QtQuick 2.9; Rectangle {color: "transparent"; width: 30; height: 20}',
                                gridMapSingleGame)
                    arrRectTrasparent[arrRectTrasparent.length] = component
                }
            }
        }
    }

    function stopRotationBranchGame(ii, jj) {

        if (isLockedQuickTip == 1)
            isLockedQuickTip = 0
        GenerationBranchScript.revivalBranchStart()
        if (GenerationBranchScript.isCompletedGame() === true) {
            GenerationBranchScript.isCompleted = 1
            if (timerGame.running === true)
                timerGame.stop()
            if (timerBlockTimeGame.running === true)
                timerBlockTimeGame.stop()
            textScoreCurrentGame.text
                    = GenerationBranchScript.listObjectSingleLevels[currentLevel].currentScore
            animationRectCompletedGameUp.running = true
            gridMapSingleGame.spacing = 0
            startAnimationBranch()
            audioGoodGame.play()
            var nameUser = mainWindow.getSetting("nameUser", "NONAME")
            mainWindow.addScore(
                        nameUser,
                        GenerationBranchScript.listObjectSingleLevels[currentLevel].currentScore,
                        GenerationBranchScript.listObjectSingleLevels[currentLevel].name)
            sendRequestRatingSet(
                        GenerationBranchScript.listObjectSingleLevels[currentLevel].name)
        }
    }

    function stopRotationBranch(ii, jj) {

        GenerationBranchScript.listGameBranchObject[ii][jj].stopRotation = 1
        var countStopBranch = 0
        arrBranchRotation = []
        for (var i = 0; i < GenerationBranchScript.heightGame; i++) {
            for (var j = 0; j < GenerationBranchScript.widthGame; j++) {
                if (GenerationBranchScript.listGameBranchObject[i][j] !== null) {
                    if (GenerationBranchScript.listGameBranchObject[i][j].stopRotation === 1) {
                        countStopBranch++
                    }
                    arrBranchRotation[arrBranchRotation.length] = {
                        posI: i,
                        posJ: j
                    }
                }
            }
        }
        if (arrBranchRotation.length === countStopBranch) {
            isLockedQuickTip = 0
            GenerationBranchScript.setStartBranch()
            GenerationBranchScript.revivalBranchStart()
        }
    }

    function mixMap() {
        singleGamePage.countPetals = singleGamePage.countPetalsMin
        singleGamePage.emitRatePetals = singleGamePage.emitRatePetalsMin
        resetParticleSystems()
        isLockedQuickTip = 1
        var arrBranch = []
        for (var i = 0; i < GenerationBranchScript.heightGame; i++) {
            for (var j = 0; j < GenerationBranchScript.widthGame; j++) {
                if (GenerationBranchScript.listGameBranchObject[i][j] !== null) {
                    arrBranch[arrBranch.length] = {
                        posI: i,
                        posJ: j
                    }
                }
            }
        }
        var countBranchInMap = arrBranch.length
        var stepGame = 0
        var arrRotation = []
        while (arrBranch.length > 0 && stepGame < (countBranchInMap * 2)) {
            var startPoint = GenerationBranchScript.getRandomInt(
                        0, arrBranch.length - 1)
            i = arrBranch[startPoint].posI
            j = arrBranch[startPoint].posJ
            if (GenerationBranchScript.listGameBranchObject[i][j].nameItem !== 'branch_05') {

                if (GenerationBranchScript.listGameBranchObject[i][j].rotationBranch === 270) {
                    if (GenerationBranchScript.listGameBranchObject[i][j].nameItem == 'branch_01') {
                        arrRotation = [270, 180]
                    } else {
                        arrRotation = [270, 180]
                    }
                }

                if (GenerationBranchScript.listGameBranchObject[i][j].rotationBranch === 0) {
                    if (GenerationBranchScript.listGameBranchObject[i][j].nameItem == 'branch_01') {
                        arrRotation = [0, 270]
                    } else {
                        arrRotation = [0, 270, 180, 90]
                    }
                }
                if (GenerationBranchScript.listGameBranchObject[i][j].rotationBranch === 180) {
                    if (GenerationBranchScript.listGameBranchObject[i][j].nameItem == 'branch_01') {
                        arrRotation = [180, 90]
                    } else {
                        arrRotation = [180, 90, 0, 270]
                    }
                }

                if (GenerationBranchScript.listGameBranchObject[i][j].rotationBranch === 90) {
                    if (GenerationBranchScript.listGameBranchObject[i][j].nameItem == 'branch_01') {
                        arrRotation = [90, 0]
                    } else {
                        arrRotation = [90, 0, 270, 180]
                    }
                }

                var typeRotation = GenerationBranchScript.getRandomInt(
                            0, arrRotation.length - 1)
                if (typeRotation === 0)
                    typeRotation = 1
                GenerationBranchScript.listGameBranchObject[i][j].fromRotationBranch
                        = GenerationBranchScript.listGameBranchObject[i][j].rotationBranch
                GenerationBranchScript.listGameBranchObject[i][j].toRotationBranch
                        = arrRotation[typeRotation]
                GenerationBranchScript.listGameBranchObject[i][j].stopRotation = 0
                GenerationBranchScript.listGameBranchObject[i][j].startAnimationRotation()

                for (var n = 0; n < GenerationBranchScript.listImageBranchFull.length; n++) {
                    if (GenerationBranchScript.listImageBranchFull[n].name
                            == GenerationBranchScript.listGameBranchObject[i][j].nameItem
                            && GenerationBranchScript.listImageBranchFull[n].rotation
                            == GenerationBranchScript.listGameBranchObject[i][j].toRotationBranch) {
                        GenerationBranchScript.listGameBranchObject[i][j].posLeft
                                = GenerationBranchScript.listImageBranchFull[n].left
                        GenerationBranchScript.listGameBranchObject[i][j].posRight
                                = GenerationBranchScript.listImageBranchFull[n].right
                        GenerationBranchScript.listGameBranchObject[i][j].posTop
                                = GenerationBranchScript.listImageBranchFull[n].top
                        GenerationBranchScript.listGameBranchObject[i][j].posBottom
                                = GenerationBranchScript.listImageBranchFull[n].bottom
                        stepGame += typeRotation
                    }
                }
            }
            arrBranch.splice(startPoint, 1)
        }

        GenerationBranchScript.listObjectSingleLevels[currentLevel].currentScore
                = 4 * countBranchInMap * GenerationBranchScript.SCORE_ROTATION_BRANCH
        GenerationBranchScript.listObjectSingleLevels[currentLevel].currentStep = 0
        GenerationBranchScript.listObjectSingleLevels[currentLevel].currentTime = 0
    }

    function setScoreUserRotation(score_branch) {
        if (countStepStop === 0) {
            var score = Number(
                        GenerationBranchScript.listObjectSingleLevels[currentLevel].currentScore
                        - GenerationBranchScript.SCORE_ROTATION_BRANCH * score_branch)
            GenerationBranchScript.listObjectSingleLevels[currentLevel].currentScore
                    = score > 0 ? score : 0
            textScoreGameLantern.text
                    = GenerationBranchScript.listObjectSingleLevels[currentLevel].currentScore
            GenerationBranchScript.listObjectSingleLevels[currentLevel].currentStep++
            textStepGameLantern.text
                    = GenerationBranchScript.listObjectSingleLevels[currentLevel].currentStep

            if (score <= 0) {
                visibleFailedGameWindow()
                if (timerGame.running === true)
                    timerGame.stop()
                return false
            }
        } else {
            countStepStop--
            textStepStopLantern.text = countStepStop
            if (countStepStop === 0) {
                imageLanternStep.source = "qrc:/resources/images/lantern_step.png"

                if (countBlockStepLevel >= GenerationBranchScript.listObjectSingleLevels[currentLevel].countBlockStep) {
                    iceStepButton.source = "qrc:/resources/images/lantern_step_locked.png"
                } else {
                    iceStepButton.source = "qrc:/resources/images/lantern_step_ice_booster.png"
                }

                if (countBlockTimeLevel >= GenerationBranchScript.listObjectSingleLevels[currentLevel].countBlockTime) {
                    iceTimeButton.source = "qrc:/resources/images/lantern_time_locked.png"
                } else {
                    iceTimeButton.source = "qrc:/resources/images/lantern_time_ice_booster.png"
                }

                textStepLantern.visible = true
                textStepGameLantern.visible = true
                rectStepStopLantern.visible = false
            }
        }
        return true
    }

    function rotationBranch(i, j) {

        if (!GenerationBranchScript.isPlayGame
                || GenerationBranchScript.isCompleted)
            return

        var paramRotation = GenerationBranchScript.listGameBranchObject[i][j].rotationBranch
        var paramRotation2 = 0

        if (GenerationBranchScript.listGameBranchObject[i][j].nameItem == 'branch_05') {
            return
        } else {
            if (paramRotation == 0) {
                paramRotation = 90
                paramRotation2 = 90
            } else if (paramRotation == 90) {
                paramRotation = 180
                paramRotation2 = 180
            } else if (paramRotation == 180) {
                paramRotation = 270
                paramRotation2 = 270
            } else if (paramRotation == 270) {
                paramRotation = 0
                paramRotation2 = 360
            }
        }

        var scoreBranch = 1
        GenerationBranchScript.listGameBranchObject[i][j].fromRotationBranch
                = GenerationBranchScript.listGameBranchObject[i][j].rotationBranch
        GenerationBranchScript.listGameBranchObject[i][j].toRotationBranch = paramRotation2
        GenerationBranchScript.listGameBranchObject[i][j].startAnimationRotationGame()
        audioClickBranch.play()

        for (var n = 0; n < GenerationBranchScript.listImageBranchFull.length; n++) {
            if (GenerationBranchScript.listImageBranchFull[n].name
                    == GenerationBranchScript.listGameBranchObject[i][j].nameItem
                    && GenerationBranchScript.listImageBranchFull[n].rotation == paramRotation) {
                GenerationBranchScript.listGameBranchObject[i][j].posLeft
                        = GenerationBranchScript.listImageBranchFull[n].left
                GenerationBranchScript.listGameBranchObject[i][j].posRight
                        = GenerationBranchScript.listImageBranchFull[n].right
                GenerationBranchScript.listGameBranchObject[i][j].posTop
                        = GenerationBranchScript.listImageBranchFull[n].top
                GenerationBranchScript.listGameBranchObject[i][j].posBottom
                        = GenerationBranchScript.listImageBranchFull[n].bottom
                scoreBranch = GenerationBranchScript.listImageBranchFull[n].score
                break
            }
        }

        if (setScoreUserRotation(scoreBranch) === false)
            return
    }

    function sendRequestRatingSet(rating_type) {

        var xhr = new XMLHttpRequest()
        xhr.timeout = 5000
        xhr.open('GET', "https://sakuramobile.sourceforge.io/cgi-bin/manager.cgi?key="
                 + GenerationBranchScript.SERVER_KEY + "&action=rating_set&user_id="
                 + encodeURIComponent(mainWindow.getSetting(
                                          "userUuid", "")) + "&user_name=" + encodeURIComponent(
                     mainWindow.getSetting("nameUser",
                                           "NONAME")) + "&rating_type="
                 + encodeURIComponent(rating_type)
                 + "&score=" + GenerationBranchScript.listObjectSingleLevels[currentLevel].currentScore,
                 true)
        busyIndicatorRatingSet.running = true
        busyIndicatorRatingSet.visible = true
        xhr.send()

        xhr.onreadystatechange = function () {
            busyIndicatorRatingSet.running = false
            busyIndicatorRatingSet.visible = false
            if (xhr.readyState != 4)
                return
            if (xhr.status != 200) {
                console.log(xhr.status + ': ' + xhr.statusText)
            } else {
                var res = JSON.parse(xhr.responseText)
                if (res["result"] === "success") {
                    StoreHelper.requestReview()
                    if (res["updated"] === "true") {
                        rowTextAvardGame.visible = true
                        textAvardPlace.text = res["place"]
                        singleGamePage.countPetals = singleGamePage.countPetalsMax
                        singleGamePage.emitRatePetals = singleGamePage.emitRatePetalsMax
                    }
                } else {
                    console.log(res)
                }
            }
        }
    }

    function startAnimationBranch() {
        for (var i = 0; i < GenerationBranchScript.heightGame; i++) {
            for (var j = 0; j < GenerationBranchScript.widthGame; j++) {
                if (GenerationBranchScript.listGameBranchObject[i][j] !== null) {
                    GenerationBranchScript.listGameBranchObject[i][j].startTimerBlossomedBranch()
                }
            }
        }
    }
}
