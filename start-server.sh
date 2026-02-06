#!/bin/bash
# Script para iniciar el servidor Zola sin timeout

# Matar cualquier instancia anterior
pkill -f "zola serve"

# Esperar a que termine
sleep 1

# Iniciar servidor con nohup (sin timeout)
cd "$(dirname "$0")"
nohup ./zola serve --interface 0.0.0.0 --port 1111 --base-url http://pot > zola.log 2>&1 &

# Mostrar PID
ZOLA_PID=$!
echo "Servidor Zola iniciado con PID: $ZOLA_PID"
echo "Log: zola.log"
echo "URL: http://pot:1111"

# Verificar que está corriendo
sleep 2
if ps -p $ZOLA_PID > /dev/null; then
    echo "✅ Servidor corriendo correctamente"
else
    echo "❌ Error al iniciar servidor"
    exit 1
fi
