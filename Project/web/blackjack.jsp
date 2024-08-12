<%-- 
    Document   : Blackjack.jsp
    Created on : Mar 8, 2024, 1:37:52 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Blackjack</title>

        <script type="text/javascript" src="js/Card.js"></script>
        <script type="text/javascript" src="js/DisplayedCard.js"></script>
        <script type="text/javascript" src="js/prototype.js"></script>
        <script type="text/javascript" src="js/scriptaculous.js?load=effects"></script>

        <script type="text/javascript">

            // Tạo một biến JavaScript và gán giá trị của requestScope.money cho nó
            var money = ${requestScope.player.balance};



            var dealerCards = [];  // Arrays holding the DisplayCard objects used to show the cards
            var playerCards = [];

            dealerCards.count = 0;  // Number of cards actually in the dealer's hand
            playerCards.count = 0;   // Number of cards actually in the player's hand

            var deck = new Deck();

            var gameInProgress = false;

            var bet;
            var betInput;
            //var money = 100;
            var moneyDisplay;
            var message;

            var standButton, hitButton, newGameButton, nextGameButton, homeButton;  // objects representing the buttons, so I can enable/disable them



            function setup() {
                for (var i = 1; i <= 5; i++) {
                    dealerCards[i] = new DisplayedCard("dealer" + i);
                    dealerCards[i].cardContainer.style.display = "none";
                    playerCards[i] = new DisplayedCard("player" + i);
                    playerCards[i].cardContainer.style.display = "none";
                }
                message = document.getElementById("message");
                standButton = document.getElementById("standButton");
                hitButton = document.getElementById("hitButton");
                newGameButton = document.getElementById("newGameButton");
                nextGameButton = document.getElementById("nextGameButton");
                homeButton = document.getElementById("homeButton");
                moneyDisplay = document.getElementById("money");

                moneyDisplay.innerHTML = "$" + money;
                betInput = document.getElementById("bet");
                betInput.value = 10;
                betInput.disabled = false;
                standButton.disabled = true;
                hitButton.disabled = true;
                newGameButton.disabled = false;
                nextGameButton.disabled = true;
                homeButton.disabled = false;
            }


            function dealCard(cards, runOnFinish, faceDown) {
                var crd = deck.nextCard();
                cards.count++;
                if (faceDown)
                    cards[cards.count].setFaceDown();
                else
                    cards[cards.count].setFaceUp();
                cards[cards.count].setCard(crd);
                new Effect.SlideDown(cards[cards.count].cardContainer, {
                    duration: 0.5,
                    queue: "end",
                    afterFinish: runOnFinish
                });
            }

            function getTotal(hand) {
                var total = 0;
                var ace = false;
                for (var i = 1; i <= hand.count; i++) {
                    total += Math.min(10, hand[i].card.value);
                    if (hand[i].card.value == 1)
                        ace = true;
                }
                if (total + 10 <= 21 && ace)
                    total += 10;
                return total;
            }


            function startGame() {
                if (!gameInProgress) {
                    newGameButton.disabled = true;
                    homeButton.disabled = true;
                    var betText = betInput.value;

                    if (!betText.match(/^[0-9]+$/) || betText < 1 || betText > money) {
                        message.innerHTML = "Tiền cược phải nằm trong khoảng từ 0 đến " + money +
                                ".<br>Tiếp tục bằng cách nhấn chia bài.";
                        new Effect.Shake("betdiv");
                        homeButton.disabled = false;
                        return;
                    }
                    betInput.disabled = true;
                    bet = Number(betText);
                    for (var i = 1; i <= 5; i++) {
                        playerCards[i].cardContainer.style.display = "none";
                        playerCards[i].setFaceDown();
                        dealerCards[i].cardContainer.style.display = "none";
                        dealerCards[i].setFaceDown();
                    }
                    message.innerHTML = "Đang phát bài";
                    deck.shuffle();
                    dealerCards.count = 0;
                    playerCards.count = 0;
                    dealCard(playerCards);
                    dealCard(dealerCards);
                    dealCard(playerCards);
                    dealCard(dealerCards, function () {
                        standButton.disabled = false;
                        hitButton.disabled = false;
                        newGameButton.disabled = true;
                        gameInProgress = true;
                        var dealerTotal = getTotal(dealerCards);
                        var playerTotal = getTotal(playerCards);
                        if (dealerTotal == 21) {
                            if (playerTotal == 21)
                                endGame(false, "Cả hai có Blackjack, nhưng dealer thắng vì hòa.");
                            else
                                endGame(false, "Dealer có Blackjack.");
                        } else if (playerTotal == 21)
                            endGame(true, "Bạn có Blackjack.");
                        else
                            message.innerHTML = "Bạn có " + playerTotal + ".  Rút hay dừng?";
                    }, true);
                }

            }

            var result = true;

            function endGame(win, why) {

                if (win)
                    money += bet;

                else {
                    money -= bet;
                    result = false;
                }
                message.innerHTML = (win ? "Chúc mừng! Bạn đã thắng.  " : "Rất tiếc! Bạn đã thua.  ") + why +
                        (money > 0 ? "<br>Nhấn Kết Thúc để chơi lại." : "<br>Có vẻ bạn đã hết tiền!");

                standButton.disabled = true;
                hitButton.disabled = true;
                newGameButton.disabled = true;
                nextGameButton.disabled = false;
                gameInProgress = false;
                if (dealerCards[2].faceDown) {
                    dealerCards[2].cardContainer.style.display = "none";
                    dealerCards[2].setFaceUp();
                    new Effect.SlideDown(dealerCards[2].cardContainer, {duration: 0.5, queue: "end"});
                }

                new Effect.Fade(moneyDisplay, {
                    duration: 0.5,
                    queue: "end",
                    afterFinish: function () {
                        moneyDisplay.innerHTML = "$" + money;
                        new Effect.Appear(moneyDisplay, {
                            duration: 0.5,
                            queue: "end",
                            afterFinish: function () {
                                if (money <= 0) {
                                    new Effect.Shake(moneyDisplay);
                                } else {
                                    if (bet > money)
                                    standButton.disabled = true;
                                    hitButton.disabled = true;
                                    newGameButton.disabled = true;
                                    betInput.disabled = false;
                                    nextGameButton.disabled = false;



                                }
                            }
                        });
                    }
                });

            }

            function startNextGame() {
                //chuyen huong ve servlet
                var betText = betInput.value;
                if (!result) {
                    betText = "-" + betText;
                }

                var dtotal = getTotal(dealerCards);
                var ptotal = getTotal(playerCards);

                window.location = "blackjack?user=${sessionScope.player.username}&betMoney=" + betText + "&dtotal=" + dtotal + "&ptotal=" + ptotal;
            }

            function dealersTurnAndEndGame() {
                message.innerHTML = "Lượt của dealer...";
                dealerCards[2].cardContainer.style.display = "none";
                dealerCards[2].setFaceUp();
                var takeNextCardOrFinish = function () {
                    new Effect.SlideDown(dealerCards[dealerCards.count].cardContainer, {
                        duration: 0.5,
                        queue: "end",
                        afterFinish: function () {
                            var dealerTotal = getTotal(dealerCards);
                            if (dealerCards.count < 5 && dealerTotal <= 16) {
                                dealerCards.count++;
                                dealerCards[dealerCards.count].setCard(deck.nextCard());
                                dealerCards[dealerCards.count].setFaceUp();
                                takeNextCardOrFinish();
                            } else if (dealerTotal > 21)
                                endGame(true, "Dealer đã vượt quá 21 điểm.");
                            else if (dealerCards.count == 5)
                                endGame(false, "Dealer rút 5 lá mà không vượt quá 21 điểm.");
                            else {
                                var playerTotal = getTotal(playerCards);
                                if (playerTotal > dealerTotal)
                                    endGame(true, "Bạn có " + playerTotal + ". Dealer có " + dealerTotal + ".");
                                else if (playerTotal < dealerTotal)
                                    endGame(false, "Bạn có " + playerTotal + ". Dealer có " + dealerTotal + ".");
                                else
                                    endGame(false, "Bạn và dealer hòa tại " + playerTotal + ".");
                            }
                        }
                    });
                };
                takeNextCardOrFinish();
            }

            function hit() {
                if (!gameInProgress)
                    return;
                standButton.disabled = true;
                hitButton.disabled = true;
                dealCard(playerCards, function () {
                    var playerTotal = getTotal(playerCards);
                    if (playerTotal > 21)
                        endGame(false, "BẠN VƯỢT QUÁ 21 điểm!");
                    else if (playerCards.count == 5)
                        endGame(true, "Bạn rút 5 lá mà không vượt quá 21 điểm.");
                    else if (playerTotal == 21)
                        dealersTurnAndEndGame();
                    else {
                        message.innerHTML = "Bạn có " + playerTotal + ". Rút hay dừng?";
                        hitButton.disabled = false;
                        standButton.disabled = false;
                    }
                });
            }

            function stand() {
                if (!gameInProgress)
                    return;
                hitButton.disabled = true;
                standButton.disabled = true;
                dealersTurnAndEndGame();
            }

            onload = setup;
            
            
            function redirectToPage() {
                window.location.href = "home?user=${requestScope.player.username}&page=1";
            }

        </script>
    </head>
    <body style="background-color: black;">
        <h1 style="color:white"> </h1>
        <table align=center cellpadding=0 cellspacing=10 border=0;>
            <tr><td align=center>
                    <button id="homeButton" onclick="redirectToPage()">Về trang chủ</button>
                </td></tr>
            <tr><td>
                    <div style="position: relative; border: thick solid #660; background-color: #280; width: 579px; height:500px">
                        <div style="position: absolute; left:20px; top:15px; color:#9F9; font-size:large">Bài của dealer:</div>
                        <div id="dealer1" style="position: absolute; left: 50px; top:50px;  border: 2px solid #660; background-color: #660"></div>
                        <div id="dealer2" style="position: absolute; left: 150px; top:50px;  border: 2px solid #660; background-color: #660"></div>
                        <div id="dealer3" style="position: absolute; left: 250px; top:50px;  border: 2px solid #660; background-color: #660"></div>
                        <div id="dealer4" style="position: absolute; left: 350px; top:50px;  border: 2px solid #660; background-color: #660"></div>
                        <div id="dealer5" style="position: absolute; left: 450px; top:50px;  border: 2px solid #660; background-color: #660"></div>
                        <div style="position: absolute; left:20px; top:210px; color:#9F9; font-size:large">Bài của bạn:</div>
                        <div id="player1" style="position: absolute; left: 50px; top:250px;  border: 2px solid #660; background-color: #660"></div>
                        <div id="player2" style="position: absolute; left: 150px; top:250px;  border: 2px solid #660; background-color: #660"></div>
                        <div id="player3" style="position: absolute; left: 250px; top:250px;  border: 2px solid #660; background-color: #660"></div>
                        <div id="player4" style="position: absolute; left: 350px; top:250px;  border: 2px solid #660; background-color: #660"></div>
                        <div id="player5" style="position: absolute; left: 450px; top:250px;  border: 2px solid #660; background-color: #660"></div>
                        <div style="position: absolute; left:20px; top: 410px; color:#9F9; font-size:large">Tiền của bạn:</div>
                        <div id="money" style="position: absolute; left: 70px; top:445px; color:yellow; font-size:x-large"></div>
                        <div id="betdiv" style="position:absolute; left:300px; top:425px">
                            <span style="color:#9F9">Tiền cược:</span>&nbsp; <input type=text size=10 id="bet">
                        </div>
                    </div>
                </td></tr>
            <tr><td align=center>
                    <button id="hitButton" onclick="hit()" disabled>Rút thêm</button>
                    <button id="standButton" onclick="stand()" disabled>Dừng rút</button>
                    <button id="newGameButton" onclick="startGame()">Chia bài</button>
                    <button id="nextGameButton" onclick="startNextGame()">Kết thúc</button>
                </td></tr>

            <tr><td align=center>
                    <span id="message" style="color:yellow; font-weight:bold">Nhấn "Chia bài" để bắt đầu.</span>
                </td></tr>
        </table>
    </body>
