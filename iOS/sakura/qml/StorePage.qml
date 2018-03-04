import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtPurchasing 1.0

Item {
    id: storePage

    function getPrice(status, price) {
        if (status === Product.Registered) {
            var result = /([\d \.,]+)/.exec(price);

            if (Array.isArray(result) && result.length > 1) {
                return result[1].trim();
            } else {
                return qsTr("BUY");
            }
        } else {
            return qsTr("BUY");
        }
    }

    Store {
        id: store

        Product {
            id:         gameTipX5Product
            identifier: "sakura.consumable.gametip.x5"
            type:       Product.Consumable

            onPurchaseSucceeded: {
                if (mainWindow.getSetting("countQuickTip",
                                          "") === "") {
                    mainWindow.setSetting("countQuickTip", 5)
                } else {
                    mainWindow.setSetting("countQuickTip", Number(
                                              mainWindow.getSetting(
                                                  "countQuickTip",
                                                  "")) + 5)
                }

                transaction.finalize();
            }

            onPurchaseRestored: {
                transaction.finalize();
            }

            onPurchaseFailed: {
                if (transaction.failureReason === Transaction.ErrorOccurred) {
                    console.log(transaction.errorString);
                }

                transaction.finalize();
            }
        }

        Product {
            id:         stepPauseX5Product
            identifier: "sakura.consumable.steppause.x5"
            type:       Product.Consumable

            onPurchaseSucceeded: {
                if (mainWindow.getSetting("countBlockStepLantern",
                                          "") === "") {
                    mainWindow.setSetting("countBlockStepLantern",
                                          5)
                } else {
                    mainWindow.setSetting(
                                "countBlockStepLantern",
                                Number(mainWindow.getSetting(
                                           "countBlockStepLantern",
                                           "")) + 5)
                }

                transaction.finalize();
            }

            onPurchaseRestored: {
                transaction.finalize();
            }

            onPurchaseFailed: {
                if (transaction.failureReason === Transaction.ErrorOccurred) {
                    console.log(transaction.errorString);
                }

                transaction.finalize();
            }
        }

        Product {
            id:         timePauseX5Product
            identifier: "sakura.consumable.timepause.x5"
            type:       Product.Consumable

            onPurchaseSucceeded: {
                if (mainWindow.getSetting("countBlockTimeLantern",
                                          "") === "") {
                    mainWindow.setSetting("countBlockTimeLantern",
                                          5)
                } else {
                    mainWindow.setSetting(
                                "countBlockTimeLantern",
                                Number(mainWindow.getSetting(
                                           "countBlockTimeLantern",
                                           "")) + 5)
                }

                transaction.finalize();
            }

            onPurchaseRestored: {
                transaction.finalize();
            }

            onPurchaseFailed: {
                if (transaction.failureReason === Transaction.ErrorOccurred) {
                    console.log(transaction.errorString);
                }

                transaction.finalize();
            }
        }

        Product {
            id:         gameTipX20Product
            identifier: "sakura.consumable.gametip.x20"
            type:       Product.Consumable

            onPurchaseSucceeded: {
                if (mainWindow.getSetting("countQuickTip",
                                          "") === "") {
                    mainWindow.setSetting("countQuickTip", 20)
                } else {
                    mainWindow.setSetting("countQuickTip", Number(
                                              mainWindow.getSetting(
                                                  "countQuickTip",
                                                  "")) + 20)
                }

                transaction.finalize();
            }

            onPurchaseRestored: {
                transaction.finalize();
            }

            onPurchaseFailed: {
                if (transaction.failureReason === Transaction.ErrorOccurred) {
                    console.log(transaction.errorString);
                }

                transaction.finalize();
            }
        }

        Product {
            id:         stepPauseX20Product
            identifier: "sakura.consumable.steppause.x20"
            type:       Product.Consumable

            onPurchaseSucceeded: {
                if (mainWindow.getSetting("countBlockStepLantern",
                                          "") === "") {
                    mainWindow.setSetting("countBlockStepLantern",
                                          20)
                } else {
                    mainWindow.setSetting(
                                "countBlockStepLantern",
                                Number(mainWindow.getSetting(
                                           "countBlockStepLantern",
                                           "")) + 20)
                }

                transaction.finalize();
            }

            onPurchaseRestored: {
                transaction.finalize();
            }

            onPurchaseFailed: {
                if (transaction.failureReason === Transaction.ErrorOccurred) {
                    console.log(transaction.errorString);
                }

                transaction.finalize();
            }
        }

        Product {
            id:         timePauseX20Product
            identifier: "sakura.consumable.timepause.x20"
            type:       Product.Consumable

            onPurchaseSucceeded: {
                if (mainWindow.getSetting("countBlockTimeLantern",
                                          "") === "") {
                    mainWindow.setSetting("countBlockTimeLantern",
                                          20)
                } else {
                    mainWindow.setSetting(
                                "countBlockTimeLantern",
                                Number(mainWindow.getSetting(
                                           "countBlockTimeLantern",
                                           "")) + 20)
                }

                transaction.finalize();
            }

            onPurchaseRestored: {
                transaction.finalize();
            }

            onPurchaseFailed: {
                if (transaction.failureReason === Transaction.ErrorOccurred) {
                    console.log(transaction.errorString);
                }

                transaction.finalize();
            }
        }

        Product {
            id:         boosterPackageX20Product
            identifier: "sakura.consumable.boosters.x20"
            type:       Product.Consumable

            onPurchaseSucceeded: {
                if (mainWindow.getSetting("countBlockStepLantern",
                                          "") === "") {
                    mainWindow.setSetting("countBlockStepLantern",
                                          20)
                } else {
                    mainWindow.setSetting(
                                "countBlockStepLantern",
                                Number(mainWindow.getSetting(
                                           "countBlockStepLantern",
                                           "")) + 20)
                }

                if (mainWindow.getSetting("countBlockTimeLantern",
                                          "") === "") {
                    mainWindow.setSetting("countBlockTimeLantern",
                                          20)
                } else {
                    mainWindow.setSetting(
                                "countBlockTimeLantern",
                                Number(mainWindow.getSetting(
                                           "countBlockTimeLantern",
                                           "")) + 20)
                }

                if (mainWindow.getSetting("countQuickTip",
                                          "") === "") {
                    mainWindow.setSetting("countQuickTip", 20)
                } else {
                    mainWindow.setSetting("countQuickTip", Number(
                                              mainWindow.getSetting(
                                                  "countQuickTip",
                                                  "")) + 20)
                }

                transaction.finalize();
            }

            onPurchaseRestored: {
                transaction.finalize();
            }

            onPurchaseFailed: {
                if (transaction.failureReason === Transaction.ErrorOccurred) {
                    console.log(transaction.errorString);
                }

                transaction.finalize();
            }
        }

        Product {
            id:         removeAdsProduct
            identifier: "sakura.unlockable.removeads"
            type:       Product.Unlockable

            onPurchaseSucceeded: {
                mainWindow.disableAds = true;

                transaction.finalize();
            }

            onPurchaseRestored: {
                mainWindow.disableAds = true;

                transaction.finalize();
            }

            onPurchaseFailed: {
                if (transaction.failureReason === Transaction.ErrorOccurred) {
                    console.log(transaction.errorString);
                }

                transaction.finalize();
            }
        }
    }

    Image {
        id: imageBackgroundStorePage
        source: "qrc:/resources/images/background_main.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop

        Rectangle {
            color: "black"
            opacity: 0.6
            anchors.fill: parent
        }

        Flickable {
            anchors.centerIn: parent
            width: buttonsColumn.width
            height: Math.min(
                        buttonsColumn.height,
                        parent.height - (backButton.height
                                         + backButton.anchors.bottomMargin) * 2 - 8)
            contentWidth: buttonsColumn.width
            contentHeight: buttonsColumn.height
            clip: true

            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AsNeeded
            }

            Column {
                id: buttonsColumn
                spacing: 1
                Image {
                    id: purchase1
                    source: "qrc:/resources/images/rectangle-hi.png"

                    width: 300
                    height: 60

                    Rectangle {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 35
                        radius: 20
                        width: 80
                        height: 30
                        border.color: "#C5007F"
                        border.width: 3
                        gradient: Gradient {
                            GradientStop {
                                position: 0.0
                                color: "#C5007F"
                            }
                            GradientStop {
                                position: 1.0
                                color: "purple"
                            }
                        }
                        Text {
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 10
                            text: "5"
                            font.pointSize: 20
                            font.family: "Helvetica"
                            color: "white"
                        }
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        source: "qrc:/resources/images/button_quick_tip.png"
                        width: 50
                        height: 50
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        source: "qrc:/resources/images/button_store.png"
                        width: 100
                        height: 30
                        Text {
                            anchors.centerIn: parent
                            text: storePage.getPrice(gameTipX5Product.status, gameTipX5Product.price)
                            color: "white"
                            font.pointSize: 14
                            font.family: "Helvetica"
                        }
                    }

                    MouseArea {
                        id: mouseAreaPurchase1
                        anchors.fill: parent
                        z: 1

                        onClicked: {
                            gameTipX5Product.purchase();
                        }
                    }
                }

                Image {
                    id: purchase2
                    source: "qrc:/resources/images/rectangle-hi.png"
                    width: 300
                    height: 60
                    Rectangle {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 35
                        radius: 20
                        width: 80
                        height: 30
                        border.color: "#C5007F"
                        border.width: 3
                        gradient: Gradient {
                            GradientStop {
                                position: 0.0
                                color: "#C5007F"
                            }
                            GradientStop {
                                position: 1.0
                                color: "purple"
                            }
                        }
                        Text {
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 10
                            text: "5"
                            font.pointSize: 20
                            font.family: "Helvetica"
                            color: "white"
                        }
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        source: "qrc:/resources/images/lantern_step_ice_booster.png"
                        width: 50
                        height: 50
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        source: "qrc:/resources/images/button_store.png"
                        width: 100
                        height: 30
                        Text {
                            anchors.centerIn: parent
                            text: storePage.getPrice(stepPauseX5Product.status, stepPauseX5Product.price)
                            color: "white"
                            font.pointSize: 14
                            font.family: "Helvetica"
                        }
                    }
                    MouseArea {
                        id: mouseAreaPurchase2
                        anchors.fill: parent
                        z: 1

                        onClicked: {
                            stepPauseX5Product.purchase();
                        }
                    }
                }

                Image {
                    id: purchase3
                    source: "qrc:/resources/images/rectangle-hi.png"
                    width: 300
                    height: 60
                    Rectangle {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 35
                        radius: 20
                        width: 80
                        height: 30
                        border.color: "#C5007F"
                        border.width: 3
                        gradient: Gradient {
                            GradientStop {
                                position: 0.0
                                color: "#C5007F"
                            }
                            GradientStop {
                                position: 1.0
                                color: "purple"
                            }
                        }
                        Text {
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 10
                            text: "5"
                            font.pointSize: 20
                            font.family: "Helvetica"
                            color: "white"
                        }
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        source: "qrc:/resources/images/lantern_time_ice_booster.png"
                        width: 50
                        height: 50
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        source: "qrc:/resources/images/button_store.png"
                        width: 100
                        height: 30
                        Text {
                            anchors.centerIn: parent
                            text: storePage.getPrice(timePauseX5Product.status, timePauseX5Product.price)
                            color: "white"
                            font.pointSize: 14
                            font.family: "Helvetica"
                        }
                    }

                    MouseArea {
                        id: mouseAreaPurchase3
                        anchors.fill: parent
                        z: 1

                        onClicked: {
                            timePauseX5Product.purchase();
                        }
                    }
                }

                Image {
                    id: purchase4
                    source: "qrc:/resources/images/rectangle-hi.png"
                    width: 300
                    height: 60
                    Rectangle {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 35
                        radius: 20
                        width: 80
                        height: 30
                        border.color: "#C5007F"
                        border.width: 3
                        gradient: Gradient {
                            GradientStop {
                                position: 0.0
                                color: "#C5007F"
                            }
                            GradientStop {
                                position: 1.0
                                color: "purple"
                            }
                        }
                        Text {
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 10
                            text: "20"
                            font.pointSize: 20
                            font.family: "Helvetica"
                            color: "white"
                        }
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        source: "qrc:/resources/images/button_quick_tip.png"
                        width: 50
                        height: 50
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        source: "qrc:/resources/images/button_store.png"
                        width: 100
                        height: 30
                        Text {
                            anchors.centerIn: parent
                            text: storePage.getPrice(gameTipX20Product.status, gameTipX20Product.price)
                            color: "white"
                            font.pointSize: 14
                            font.family: "Helvetica"
                        }
                    }

                    MouseArea {
                        id: mouseAreaPurchase4
                        anchors.fill: parent
                        z: 1

                        onClicked: {
                            gameTipX20Product.purchase();
                        }
                    }
                }

                Image {
                    id: purchase5
                    source: "qrc:/resources/images/rectangle-hi.png"
                    width: 300
                    height: 60
                    Rectangle {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 35
                        radius: 20
                        width: 80
                        height: 30
                        border.color: "#C5007F"
                        border.width: 3
                        gradient: Gradient {
                            GradientStop {
                                position: 0.0
                                color: "#C5007F"
                            }
                            GradientStop {
                                position: 1.0
                                color: "purple"
                            }
                        }
                        Text {
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 10
                            text: "20"
                            font.pointSize: 20
                            font.family: "Helvetica"
                            color: "white"
                        }
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        source: "qrc:/resources/images/lantern_step_ice_booster.png"
                        width: 50
                        height: 50
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        source: "qrc:/resources/images/button_store.png"
                        width: 100
                        height: 30
                        Text {
                            anchors.centerIn: parent
                            text: storePage.getPrice(stepPauseX20Product.status, stepPauseX20Product.price)
                            color: "white"
                            font.pointSize: 14
                            font.family: "Helvetica"
                        }
                    }

                    MouseArea {
                        id: mouseAreaPurchase5
                        anchors.fill: parent
                        z: 1

                        onClicked: {
                            stepPauseX20Product.purchase();
                        }
                    }
                }

                Image {
                    id: purchase6
                    source: "qrc:/resources/images/rectangle-hi.png"
                    width: 300
                    height: 60
                    Rectangle {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 35
                        radius: 20
                        width: 80
                        height: 30
                        border.color: "#C5007F"
                        border.width: 3
                        gradient: Gradient {
                            GradientStop {
                                position: 0.0
                                color: "#C5007F"
                            }
                            GradientStop {
                                position: 1.0
                                color: "purple"
                            }
                        }
                        Text {
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 10
                            text: "20"
                            font.pointSize: 20
                            font.family: "Helvetica"
                            color: "white"
                        }
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        source: "qrc:/resources/images/lantern_time_ice_booster.png"
                        width: 50
                        height: 50
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        source: "qrc:/resources/images/button_store.png"
                        width: 100
                        height: 30
                        Text {
                            anchors.centerIn: parent
                            text: storePage.getPrice(timePauseX20Product.status, timePauseX20Product.price)
                            color: "white"
                            font.pointSize: 14
                            font.family: "Helvetica"
                        }
                    }

                    MouseArea {
                        id: mouseAreaPurchase6
                        anchors.fill: parent
                        z: 1

                        onClicked: {
                            timePauseX20Product.purchase();
                        }
                    }
                }

                Image {
                    id: purchase7
                    source: "qrc:/resources/images/rectangle-hi.png"
                    width: 300
                    height: 60
                    Rectangle {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 35
                        radius: 20
                        width: 80
                        height: 30
                        border.color: "#C5007F"
                        border.width: 3
                        gradient: Gradient {
                            GradientStop {
                                position: 0.0
                                color: "#C5007F"
                            }
                            GradientStop {
                                position: 1.0
                                color: "purple"
                            }
                        }
                        Text {
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 10
                            text: "20"
                            font.pointSize: 20
                            font.family: "Helvetica"
                            color: "white"
                        }
                    }
                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        source: "qrc:/resources/images/lantern_time_ice_booster.png"
                        width: 50
                        height: 50
                    }
                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 30

                        source: "qrc:/resources/images/lantern_step_ice_booster.png"
                        width: 50
                        height: 50
                    }
                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 45

                        source: "qrc:/resources/images/button_quick_tip.png"
                        width: 35
                        height: 35
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        source: "qrc:/resources/images/button_store.png"
                        width: 100
                        height: 30
                        Text {
                            anchors.centerIn: parent
                            text: storePage.getPrice(boosterPackageX20Product.status, boosterPackageX20Product.price)
                            color: "white"
                            font.pointSize: 14
                            font.family: "Helvetica"
                        }
                    }

                    MouseArea {
                        id: mouseAreaPurchase7
                        anchors.fill: parent
                        z: 1

                        onClicked: {
                            boosterPackageX20Product.purchase();
                        }
                    }
                }

                Image {
                    id: purchase8
                    source: "qrc:/resources/images/rectangle-hi.png"
                    width: 300
                    height: 60
                    visible: !mainWindow.disableAds

                    Text {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 20
                        text: qsTr("Remove Ads")
                        font.pointSize: 16
                        font.family: "Helvetica"
                        font.bold: true
                        color: "white"
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        source: "qrc:/resources/images/button_store.png"
                        width: 100
                        height: 30
                        Text {
                            anchors.centerIn: parent
                            text: storePage.getPrice(removeAdsProduct.status, removeAdsProduct.price)
                            color: "white"
                            font.pointSize: 14
                            font.family: "Helvetica"
                        }
                    }

                    MouseArea {
                        id: mouseAreaPurchase8
                        anchors.fill: parent
                        z: 1

                        onClicked: {
                            removeAdsProduct.purchase();
                        }
                    }
                }

                Image {
                    id: purchase9
                    source: "qrc:/resources/images/rectangle-md.png"
                    width: 300
                    height: 60

                    Text {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 20
                        text: qsTr("Restore purchases")
                        font.pointSize: 16
                        font.family: "Helvetica"
                        font.bold: true
                        color: "white"
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        source: "qrc:/resources/images/button_store.png"
                        width: 100
                        height: 30
                        Text {
                            anchors.centerIn: parent
                            text: qsTr("OK")
                            color: "white"
                            font.pointSize: 14
                            font.family: "Helvetica"
                        }
                    }

                    MouseArea {
                        id: mouseAreaPurchase9
                        anchors.fill: parent
                        z: 1

                        onClicked: {
                            store.restorePurchases();
                        }
                    }
                }
            }
        }

        Image {
            id: backButton
            source: "qrc:/resources/images/back.png"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 16
            anchors.left: parent.left
            anchors.leftMargin: 15
            height: 40
            width: 40

            MouseArea {
                id: mouseAreaBackAwardsButton
                anchors.fill: parent
                onClicked: {
                    mainStackView.pop()
                }
            }
        }
    }
}
