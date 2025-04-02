#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Limpar as tabelas antes de inserir novos dados
echo "Limpando tabelas..."
$PSQL "TRUNCATE TABLE games, teams CASCADE"

# Ler o arquivo games.csv, ignorando a primeira linha (cabeçalho)
echo "Inserindo dados..."
tail -n +2 games.csv | while IFS=',' read -r year round winner opponent winner_goals opponent_goals
do
  # Inserir o time vencedor, se ainda não existir
  winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
  if [[ -z $winner_id ]]
  then
    $PSQL "INSERT INTO teams(name) VALUES('$winner')"
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
  fi

  # Inserir o time oponente, se ainda não existir
  opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
  if [[ -z $opponent_id ]]
  then
    $PSQL "INSERT INTO teams(name) VALUES('$opponent')"
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
  fi

  # Inserir o jogo na tabela games
  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals)"
done

echo "Dados inseridos com sucesso!"
