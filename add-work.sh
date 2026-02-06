#!/bin/bash
# Script para agregar una nueva obra de forma interactiva

echo "=== Agregar Nueva Obra ==="
echo ""

# Pedir información
read -p "Título de la obra: " title
read -p "Serie: " series
read -p "Año: " year
read -p "Técnica/Medium: " medium
read -p "Dimensiones (ej: 100 x 150 cm): " dimensions
read -p "Ubicación (opcional): " location
read -p "¿Obra destacada? (s/n): " featured_input

# Generar slug del título
slug=$(echo "$title" | iconv -t ascii//TRANSLIT | sed -r 's/[~^]+//g' | sed -r 's/[^a-zA-Z0-9]+/-/g' | sed -r 's/^-+\|-+$//g' | tr A-Z a-z)

# Fecha actual
date=$(date +%Y-%m-%d)

# Featured
if [[ "$featured_input" == "s" || "$featured_input" == "S" ]]; then
    featured="true"
else
    featured="false"
fi

# Crear archivo
filename="content/works/${slug}.md"

cat > "$filename" << EOF
+++
title = "${title}"
date = ${date}
[extra]
series = "${series}"
medium = "${medium}"
dimensions = "${dimensions}"
year = ${year}
${location:+location = \"$location\"}
image = "/images/works/${slug}.jpg"
featured = ${featured}
+++

Descripción de "${title}".

(Editar este archivo para agregar más detalles)
EOF

echo ""
echo "✅ Obra creada: $filename"
echo ""
echo "Próximos pasos:"
echo "1. Copiar imagen a: static/images/works/${slug}.jpg"
echo "2. Editar $filename para agregar descripción"
echo "3. Verificar en http://pot:1111/works"
echo ""
echo "Para git:"
echo "  git add ."
echo "  git commit -m 'Add: $title'"
