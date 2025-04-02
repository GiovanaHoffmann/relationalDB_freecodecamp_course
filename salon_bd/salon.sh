#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

# Função para exibir os serviços
display_services() {
    echo "$($PSQL "SELECT service_id, name FROM services")" | while IFS='|' read -r SERVICE_ID NAME
    do
        echo "$SERVICE_ID) $NAME"
    done
}

# Exibir serviços
display_services

# Ler o serviço selecionado
read SERVICE_ID_SELECTED

# Verificar se o serviço existe
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
if [[ -z $SERVICE_NAME ]]
then
    echo -e "\nI could not find that service. What would you like today?"
    display_services
    read SERVICE_ID_SELECTED
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
fi

# Ler o número de telefone
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

# Verificar se o cliente já existe
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    $($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

# Ler o horário do agendamento
echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# Obter o ID do cliente
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# Inserir o agendamento
$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

# Exibir mensagem de confirmação
echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."