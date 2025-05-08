
#!/bin/bash

# Ruta donde se van a almacenar los logs
PATH_LOG=/var/log/PrcXDSQMESSAGE


# Ruta donde se encuentras los fuentes y librerías liberadas
PATH_GX=/opt/MGM

# Contraseña del trustore
PASSWORD_TRUSTSTORE=prestador1.123

# Contraseña del keystore
PASSWORD_KEYSTORE=prestador1.123

# Archivo trustStore (ruta+archivo)
FILE_TRUSTSTORE=/opt/certs/prestador1-truststore.jks

# Archivo keystore (ruta+archivo)
FILE_KEYSTORE=/opt/certs/prestador1-keystore.jks

LOGFILE=$PATH_LOG/prcXDSQM_$1_$(date +"%Y_%m_%d").log
JAVA_CLASSPATH="lib/*:mgm_xdsbus.jar:"

function EnviaLog {
        FECHA=`date +%d-%m-%y" ("%H:%M:%S") - "`
        echo -e "$FECHA $1 \n" >> $LOGFILE
}

EnviaLog "Inicia el proceso de reenvio $1";
java -Xmx512m -cp $JAVA_CLASSPATH -Djavax.net.ssl.trustStore="$FILE_TRUSTSTORE" -Djavax.net.ssl.trustStorePassword=$PASSWORD_TRUSTSTORE -Djavax.net.ssl.keyStore="$FILE_KEYSTORE" -Djavax.net.ssl.keyStorePassword=$PASSWORD_KEYSTORE com.xdsbus.resendmessages $1 
EnviaLog "Finalizó el proceso de reenvio $1";

exit 0
~
~
~
~

