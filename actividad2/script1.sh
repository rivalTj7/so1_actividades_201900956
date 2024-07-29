    #!/bin/bash
    GITHUB_USER="rivalTj7"
    RESPONSE=$(curl -s https://api.github.com/users/${GITHUB_USER})

    USER_ID=$(echo $RESPONSE | jq -r '.id')
    CREATED_AT=$(echo $RESPONSE | jq -r '.created_at')

    MESSAGE="Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."
    echo $MESSAGE

    DATE=$(date +%Y-%m-%d)
    LOG_DIR="/tmp/$DATE"
    LOG_FILE="$LOG_DIR/saludos.log"

    mkdir -p $LOG_DIR
    echo $MESSAGE >> $LOG_FILE

#Creación del cronjob para que el script se ejecute cada 5 minutos
# (crontab -l ; echo "*/5 * * * * github_user_info.sh") | crontab -
