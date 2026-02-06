#!/bin/bash
# Script para ver el estado del servidor Zola

echo "=== Estado del Servidor Zola ==="
echo ""

ZOLA_PID=$(pgrep -f "zola serve" | tail -1)

if [ -n "$ZOLA_PID" ]; then
    echo "✅ Servidor corriendo"
    echo "   PID: $ZOLA_PID"
    echo "   Puerto: 1111"
    echo "   URL: http://pot:1111"
    echo ""
    echo "Uptime:"
    ps -p $ZOLA_PID -o etime=
    echo ""
    echo "Últimas líneas del log:"
    tail -5 zola.log 2>/dev/null || echo "   (no log disponible)"
else
    echo "❌ Servidor no está corriendo"
fi
