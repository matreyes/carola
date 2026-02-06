# Portfolio Carolina Vildósola

Sitio web de portfolio para artista visual, construido con Zola + Tailwind CSS.

## 🚀 Inicio Rápido

### Iniciar servidor de desarrollo
```bash
./start-server.sh
```
Sitio disponible en: http://pot:1111

### Detener servidor
```bash
./stop-server.sh
```

### Ver estado
```bash
./status-server.sh
```

## 📁 Estructura

```
web/
├── content/
│   ├── works/              # Obras (archivos .md con YAML)
│   │   ├── _index.md       # Índice de obras
│   │   ├── obra-01.md      # Obra individual
│   │   └── ...
│   ├── about.md            # Página "Sobre mí"
│   └── contact.md          # Página de contacto
├── templates/              # Templates HTML
│   ├── base.html           # Template base
│   ├── index.html          # Página principal
│   ├── works.html          # Galería de obras
│   └── page.html           # Páginas individuales
├── static/
│   └── images/
│       └── works/          # Imágenes de obras
├── sass/
│   └── input.css           # CSS fuente (Tailwind)
├── config.toml             # Configuración del sitio
└── README.md               # Este archivo
```

## ➕ Agregar una Nueva Obra

1. Crear archivo en `content/works/` (ej: `mi-obra.md`):

```markdown
+++
title = "Título de la Obra"
date = 2024-01-15
[extra]
series = "Nombre de la Serie"
medium = "Técnica utilizada"
dimensions = "Dimensiones en cm"
year = 2024
location = "Ubicación (opcional)"
image = "/images/works/mi-obra.jpg"
featured = true  # Aparece en portada
+++

Descripción de la obra en markdown.

Puede incluir múltiples párrafos y formateo.
```

2. Agregar imagen en `static/images/works/mi-obra.jpg`

3. El sitio se actualiza automáticamente (hot reload)

## 🎨 Personalización

### Información del artista
Editar `config.toml`:
```toml
[extra]
artist_name = "Nombre del Artista"
artist_bio = "Bio corta"
artist_email = "email@example.com"
instagram = "username"  # opcional
```

### Estilos
- Tailwind CSS configurado en `tailwind.config.js`
- Estilos custom en `sass/input.css`
- Recompilar CSS: `npm run css:build`

### Templates
Editar archivos en `templates/` para cambiar estructura o diseño.

## 📦 Compilar para Producción

```bash
cd web
../zola build
```

Sitio compilado en `web/public/`

## 🔧 Git Workflow

### Primera vez
```bash
cd web
git init
git add .
git commit -m "Initial commit"
```

### Agregar obra nueva
```bash
# 1. Agregar imagen
cp ~/mi-obra.jpg static/images/works/

# 2. Crear archivo markdown
# (editar content/works/mi-obra.md)

# 3. Commit
git add .
git commit -m "Add: Mi Obra nueva"
git push
```

## 🌐 Despliegue

### Opciones recomendadas:
- **Netlify**: Auto-deploy desde Git
- **Cloudflare Pages**: CDN global gratuito
- **GitHub Pages**: Hosting gratuito

Todos soportan Zola nativamente.

### Deploy en Netlify
1. Conectar repo Git
2. Build command: `zola build`
3. Publish directory: `public`

## 📝 Notas

- Las obras se ordenan por fecha (más reciente primero)
- `featured = true` muestra la obra en portada
- Imágenes recomendadas: proporción 3:4 (vertical)
- Formato recomendado: JPG optimizado (max 500KB)

## 🛠️ Tech Stack

- **Zola** - Static site generator
- **Tailwind CSS v4** - Styling
- **PostCSS** - CSS processing
- **YAML** - Content management
