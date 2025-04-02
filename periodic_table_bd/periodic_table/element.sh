#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
    echo "Please provide an element as an argument."
    exit 0
fi

# Verificar se o argumento é um número atômico, símbolo ou nome
if [[ $1 =~ ^[0-9]+$ ]]
then
    QUERY_RESULT=$($PSQL "SELECT atomic_number, name, symbol FROM elements WHERE atomic_number = $1")
else
    QUERY_RESULT=$($PSQL "SELECT atomic_number, name, symbol FROM elements WHERE symbol = '$1' OR name = '$1'")
fi

if [[ -z $QUERY_RESULT ]]
then
    echo "I could not find that element in the database."
    exit 0
fi

# Extrair informações do elemento
IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL <<< "$QUERY_RESULT"

# Obter informações adicionais
PROPERTIES=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM properties JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
IFS='|' read -r ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< "$PROPERTIES"

# Exibir informações
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."

