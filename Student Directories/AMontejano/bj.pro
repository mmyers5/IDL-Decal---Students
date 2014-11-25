;;;;;;;;;;;;This is a simple game of blackjack, This game will ask the
;;;;;;;;;;;;player if he wants to play blackjack, and then procede to
;;;;;;;;;;;;play a game of blackjack.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Created by: Armando Montejano and Daniel Naim




Function Card_Values_Generator,x
;;Inputs: dummy number 1
;;Outputs: a scalar from 1-13
;;Purpose: This function creates random value for each card which will be used to
;;give the player his initial hand, and when giving a new card

  random_Value=x*randomu(seed,1)*12  ;;This generates a number from 0 to 1 and multiples it by 12
  card_value=round(random_value)+1   ;;this takes the generated number value from 0 to 12 and rounds it. then adds 1 to the value
  return,card_value              

end


;;;Cardvaluesgenerator works


Function Name_the_Face, card_value

;;Input: the value of the card given in the function of Card_Values_Generator

;;Outputs:A string for the name of the card value, 

;;Purpose: This function will be used later to display the
;;player's hand, this will also fix the problem of having
;;1,11,12,13 be given as a number and have their real names

  case 1 of 
;;By setting case 1 of, this will look at the the value created from the number generator and
;;check for these 5 cases and apply the one that is true, each clause is
;;also tested in order.
  
   card_value EQ 2: card= '2 '
   card_value EQ 3: card= '3 '
   card_value EQ 4: card= '4 '
   card_value EQ 5: card= '5 '
   card_value Eq 6: card= '6 '
   card_value EQ 7: card= '7 '
   card_value EQ 8: card= '8 '
   card_value EQ 9: card= '9 '
   card_value EQ 10: card= '10 '
   card_value EQ 1: card= 'Ace '
   card_value EQ 11: card= 'Jack '
   card_value EQ 12: card= 'Queen '
   card_value EQ 13: card= 'King '
Endcase
Return, card ;;returns card to be used later again when dealing a player's hand
end


Function show_me_the_hand,card
  ;;;Input: An array from your hand 
  ;;;Outputs: A string of your hand
  ;;;Purpose: This Function will take your hand, and tell you the name
  ;;;of that card, 

  number_of_cards=n_elements(card) ;;tells us how many cards we have
  yourhand=" "                     ;;an empty string to define Yourhand
  for i=0, number_of_cards-1 do begin ;;for loop for each card
     Current_Hand=Name_the_face(card[i]) ;;takes the current card
     yourhand=yourhand+Current_hand      ;;;has your hand, added to the current card, rinse repeat
  endfor
  return, yourhand
end


Function BJ_Value, card
  ;;;Input:An array from your hand
  ;;;Outputs: The value used for blackjack and when summing up the
  ;;;players hand
  ;;;Purpose: This Function will use the correct values of each card
  ;;;(excluding the duality of ace). This will prevent the game from
  ;;;adding up 11, 12, and 13.

  case 1 of  ;;;case 1 will only look for the true statement, and no other
     card GE 10 and card LE 13: BJ_value=10
     card EQ 1: BJ_Value=1
     card EQ 2: BJ_Value=2
     card EQ 3: BJ_Value=3
     card EQ 4: BJ_Value=4
     card EQ 5: BJ_Value=5
     card EQ 6: BJ_Value=6
     card EQ 7: BJ_Value=7
     card EQ 8: BJ_Value=8
     card EQ 9: BJ_Value=9
  endcase

return, BJ_Value
end


Function Counting_Hand, cards
;;;Input: An array representing your hand
;;;Output: A scalar that is the sum of each element in your array from
;;;your hand
;;;Purpose: This will be the way to know the total value of the players
;;;hand, this function will be used to check if the player has bust, and
;;;has won blackjack

  Number_of_cards=n_elements(cards) ;;;this tells us how many cards (elements) we have in our hand (array)
  total=0                           ;;;dummy variable that will be used in forloop
  for i=0,Number_of_cards-1 do begin ;;;for loop goes thru each array and adds that value to the total
     total=BJ_value(cards[i])+total
     if BJ_value(cards[i]) EQ 1 and BJ_value(cards[i])+total lE 12 then begin ;;;if card is an ace, it will add to 10, 
        total=total+10
     endif
  endfor
  
;;;;;This works but this will just make an ace be 11 when the total is
;;;;;less that 12. the issue is, once it becomes an 11, it remains an 11
 return, total
end


Function Dealer,cards
  ;;;Input: an array representing the dealers hand
  ;;;Output: a number that will give some value between 0-10
  ;;;Purpose: This Function is used to give the probability of a dealer
  ;;;always wanting to hit. (check out the dealing hitting section in
  ;;;the procedure)
  case 1 of
     counting_hand(cards) le 11: percent_chance_of_hitting=1.1                                             ;;;100 percent of hitting
     counting_hand(cards) ge 12 and counting_hand(cards) Lt 14: percent_chance_of_hitting=randomu(seed)*4 ;;;75 percent of hitting)
     counting_hand(cards) GE 14 and counting_hand(cards) Lt 17: percent_chance_of_hitting=randomu(seed)*1.5 ;;;33.34 percent of hitting
     counting_hand(cards) GE 17 and counting_hand(cards) lt 21: percent_chance_of_hitting=randomu(seed)*1.10 ;;;9.09 precent of hitting
     counting_hand(cards) GE 21: percent_chance_of_hitting=0
     endcase
  return, percent_chance_of_hitting
end

pro blackjack
;;;Input: None, other than the ones that are asked, such as Yes and Hit
;;;Outputs: The fucking game of BlackJack
;;;Purpose:Uses all the above functions to play a game.

;;;;;Want to play
  print, "Yo Dogg, you want to play some BlackJack, you feel me? (yes/no)"
  option=''
  play:
  read, option ;;;reads the option                                                                                                                       
  wait,2
  play1:


  ;;;Want to play: no
  if strlowcase(option) eq "no" then begin
     print, "Damn, Dogg, I thought you was tight my brotha. I'm damn wrong"
     wait,1
     print, "Do you want to try and press Yes to play some BlackJack my G?"
     read, option
     
     ;;;want to play no:no
     if strlowcase(option) eq "no" then begin
        goto, the_end
     endif

     ;;;want to play no:error
     if strlowcase(option) ne "no" and strlowcase(option) ne "yes" then begin
        goto, error
     endif
  endif

  ;;;Want to play: error
  error:
  if strlowcase(option) ne "no" and strlowcase(option) ne "yes" then begin
     print, "u kno hw 2 typ?"
     wait,1
     print, "dood, i thought you know better than that, try pressing yes lil homie"
     goto, play
  endif

  
  
  ;;;want to play: yes
  while strlowcase(option) eq "yes" do begin
     print, "Word up Lil Dog, Lets BlackJack it up in this Bitch"
     wait, 2
     player1hand=[card_values_generator(1), card_values_generator(1)] ;;;Generates the players hand
     dealerhand=[card_values_generator(1), card_values_generator(1)] ;;;;;;;;
     print, "Player 1 has a hand of "+ Show_me_the_hand(player1hand)
     wait,1
     print, "Player 1 total is " + string(counting_hand(player1hand)) ;;;spits out the string of your total hand value                                                
     wait,1
     print, "Dealer has a hand of " + Show_me_the_hand(dealerhand[1]) + "and ?"
     wait,1
     choose=''

     ;;;PLAYING START
     while counting_hand(player1hand) LT 21 do begin ;;;this while loop plays while your hand is less than or equal to 21                                                 
        hit_stay:
        print, "Do you want to Hit a bitch or Stay a bitch (hit/stay)"                                                                      
        read, option
        
        ;;;Playing:Error
        if strlowcase(option) ne "hit" and strlowcase(option) ne "stay" then begin
           print, "Damn, you making me look smart, I'm gonna ask you again. Type that shit correct"
           wait, 1                                                                                                                                                      
           goto, hit_stay
        endif



        ;;;PLAYING:HIT
        if strlowcase(option) EQ "hit" then begin ;;;Gives the option to hit or stay                                                                   
           print, "Here's your hand bro"
           wait, 2
           player1hand=[player1hand,card_values_generator(1)]
           print, "Player 1 has a hand of " + Show_me_the_hand(player1hand)
           wait,2
           print, "Player 1 hand total is " + string(counting_hand(player1hand))
        endif
        

        ;;;PLAYING:STAY
        if strlowcase(option) eq "stay" then begin
           print, "Yo Dogg, That looks like a weak hand"
           wait,1
           break
        endif

        
     endwhile
;;;;;PLAYING END

     ;;;LOSE BY BUST
     if counting_hand(player1hand) GT 21 then begin ;;;if you break, it will say you bust                                                                              
        print, "You Bust, Busta"
        wait, 1
        print, "My hand total is " + string(counting_hand(dealerhand))
        wait,1
        play_again:
        print, "Fo Shizzle my Nizzle, You want another go? (Yes/No)"
        wait, 1
        read,option

        
        ;;;lose by bust: error                                                                                                                                                                                                                             
        if strlowcase(option) ne "yes" and strlowcase(option) ne "no" and strlowcase(option) ne "stay"  then begin
           print, "I'm I playing against a 2 year old?"
           wait, 1                                                                                             
           print, "Try again dogg"
           goto, play_again
        endif


     ;;;lose by Bust: no
        if strlowcase(option) eq "no" then begin ;;had a break here without the print stuff
           print, "Whatever Dogg, I'm out this bitch."
           goto, the_end
        endif  
     
     endif



     ;;;win by blackjack
     if counting_hand(player1hand) EQ 21 then begin
        print, "BlackJack, You Cheating Ass Bitch, you counting cards?"
        got_next:
        WAIT,1
        print, "Let me get next (yes/no)"
        read, option
        
        ;;Win by blackjack: error                                                                                                                                                                                                                          
        if strlowcase(option) ne "no" and strlowcase(option) ne "yes" then begin
           print, "instructions not clear, penis got stuck in printer"
           goto, got_next
        endif
        
        ;;Win by blacjkack: yes
        if strlowcase(option) eq "yes" then begin
           goto, the_end
        endif


        ;;Win by blackjack: no
        if strlowcase(option) eq "no" then begin
           print, "Don't think you can cheat again huh?"
           goto, the_end
        endif

     endif
     
     ;;;end Win by blackjack

  endwhile
     Dealer:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DEALER
     while counting_hand(dealerhand) lt 21 and counting_hand(player1hand) lt 21 and counting_hand(dealerhand) lt counting_hand(player1hand) do begin
        if dealer(dealerhand) gt 1 then begin
           print, "I hit my brotha"
           wait, 1
           dealerhand=[dealerhand, card_values_generator(1)]
           print, "Dealer has a hand of " + show_me_the_hand(dealerhand)
           wait,1
           print, "Dealer hand total is " + string(counting_hand(dealerhand))
        endif
        if dealer(dealerhand) gt 0 and dealer(dealerhand) le 1 then begin
           print, "My hand looks beautiful and sexy, I stay"
           wait, 1
           break
     ;      goto, check_to_win
        endif

        if dealer(dealerhand) eq 0 then begin
           break
        endif
     endwhile
     
     check_to_win:
     ;;;Dealer losing
     if counting_hand(dealerhand) gt 21 then begin
        print, "Didn't think I bust while counting cards"
        wait,1
        print, "YOU WIN!!!"
        try_again1:
        WAIT, 1
        print, "Another round? (yes/no)"
        read,option
        wait,1
     endif
     if strlowcase(option) eq "no" then begin
        print, "You Ain't Man enough to fuck with me, I'll eat your ass hole alive. -Mike Tyson"
        goto, the_end
     endif
     if strlowcase(option) eq "yes" then begin
        goto, the_end
     endif
     if strlowcase(option) ne "no" and option ne "yes" and option ne "stay" then begin
        print, "break, break, break, break, damnit"
        goto, try_again1
     endif
   ;  if strlowcase(yes) ne "yes" then break


;;;;;Winning general begins
     if counting_hand(player1hand) gt counting_hand(dealerhand) and counting_hand(player1hand) LE 21 then begin
        print, "Dealer's hand total is " + string(counting_hand(dealerhand)) ;;
        wait, 1
        print, "Damn, you got me beat son."
        wait,1
        print, "YOU WIN!!!"
        WAIT,1
        print, "Let me get another shot at you (yes/no)"
        try_me:
        read, option
        wait,1
     
     ;;;winning general: no
     if strlowcase(option) eq "no" then begin
        print, "Whatever, I'm out this bitch."
        goto, the_end
     endif
     
     ;;;winning general: yes
     if strlowcase(option) eq "yes" then begin
        goto, the_end
     endif

     ;;;winning general: error
     if strlowcase(option) ne "yes" and strlowcase(option) ne "no" and strlowcase(option) ne "stay" then begin
        print, "try to break my code son, I came from the hood, try me dogg (yes/no)"
        goto, try_me
     endif
  endif
     ;;had break here

;;;;;Winning General Ends


;;;;;;;;;;Losing the game Begins
     if counting_hand(dealerhand) gt counting_hand(player1hand) then begin
        print, "Dealer's hand total is " + string(counting_hand(dealerhand)) ;;
        wait,1
        print, "DAAAAAAMMMMMMNNNNNNN!!!!!! You just got your ass beat!!!!!"
        wait,1
        print, "YOU LOSE!!!!!!!!!!!"
        WAIT,1
        print, "You want another ass beating like that (yes/no)"
        square_dick:
        read, option
        wait,1
        
     ;;;Losing the game:no
     if strlowcase(option) eq "no" then begin
        print, "Yeah, I wouldn't be able to bounce back from that shit either"
        goto, the_end
     endif
     
     ;;;Losing the game:yes
     if strlowcase(option) eq "yes" then begin
        goto,the_end
     endif
     
     ;;;Losing the game:error
     if strlowcase(option) ne "no" and strlowcase(option) ne "yes" then begin
        print, "My dick is too square (play again?) (yes/no)"
        goto,square_dick
     endif
  endif
;;;;;;Losing the Game Ends
 
  the_end:
     if strlowcase(option) eq "yes" then begin
        goto,play1
     endif
  end



;;;;;;;;;Problems I have
;;;;;;;;;1)dealer will sometimes not hit when he is losing

;;;;;;;;Things i want to incorporate
;;;;;;;;1) Images for the cards instead of text
;;;;;;;;2) Multiplayer, up to 3 other human players
;;;;;;;;3) chips
