#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

if [[ -z $USER_ID ]]
then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    $($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
else
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id = $USER_ID")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id = $USER_ID")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"

NUMBER_OF_GUESSES=0

while true
do
    read GUESS
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
        echo "That is not an integer, guess again:"
    else
        NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
        if [[ $GUESS -lt $SECRET_NUMBER ]]
        then
            echo "It's higher than that, guess again:"
        elif [[ $GUESS -gt $SECRET_NUMBER ]]
        then
            echo "It's lower than that, guess again:"
        else
            echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

            if [[ -z $USER_ID ]]
            then
                USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
            fi

            $($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID")

            if [[ -z $BEST_GAME ]] || [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
            then
                $($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE user_id = $USER_ID")
            fi

            break
        fi
    fi
done