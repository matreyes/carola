# ✅ Proyecto Completo: Portfolio Carolina Vildósola

## 🎨 Lo que se creó

### Sitio Web Minimalista
- **Diseño:** Estilo portfolio artístico (inspirado en emmafineman.com)
- **Stack:** Zola (SSG) + Tailwind CSS v4
- **Responsive:** Adaptable a móvil, tablet, desktop
- **Gestión:** Contenido en YAML/Markdown + Git

### Características
✅ Navegación limpia y minimalista  
✅ Grid de obras con hover effects  
✅ Páginas individuales por obra  
✅ Secciones: Inicio, Obras, Sobre mí, Contacto  
✅ Sistema de "obras destacadas" para portada  
✅ Hot reload durante desarrollo  
✅ Sin timeout (servidor estable)  

## 📂 Estructura Final

```
web/
├── 📄 Documentación
│   ├── README.md           # Uso diario
│   ├── DEPLOY.md           # Guía de deploy
│   ├── GIT-SETUP.md        # Git workflow
│   └── PROYECTO-COMPLETO.md (este archivo)
│
├── 🛠️ Scripts
│   ├── start-server.sh     # Iniciar servidor
│   ├── stop-server.sh      # Detener servidor
│   ├── status-server.sh    # Ver estado
│   └── add-work.sh         # Agregar obra interactivo
│
├── ⚙️ Configuración
│   ├── config.toml         # Config del sitio
│   ├── tailwind.config.js  # Config Tailwind
│   ├── postcss.config.js   # Config PostCSS
│   └── .gitignore          # Archivos ignorados por Git
│
├── 📝 Contenido
│   └── content/
│       ├── works/          # Obras (*.md)
│       │   ├── _index.md
│       │   ├── armonia-vertical-01.md
│       │   ├── armonia-vertical-02.md
│       │   └── composicion-01.md
│       ├── about.md        # Sobre mí
│       └── contact.md      # Contacto
│
├── 🎨 Templates
│   └── templates/
│       ├── base.html       # Base con nav + footer
│       ├── index.html      # Portada
│       ├── works.html      # Galería completa
│       └── page.html       # Página individual
│
├── 🖼️ Assets
│   ├── static/
│   │   ├── images/
│   │   │   └── works/      # Imágenes de obras (vacío por ahora)
│   │   └── style.css       # CSS compilado
│   └── sass/
│       └── input.css       # CSS fuente (Tailwind)
│
└── 🔨 Build
    ├── public/             # Sitio compilado (auto-generado)
    └── node_modules/       # Dependencias npm
```

## 🚀 Acceso Actual

**URL local:** http://pot:1111

### Páginas disponibles:
- `/` - Portada con obras destacadas
- `/works` - Galería completa
- `/works/armonia-vertical-01` - Obra individual (ejemplo)
- `/about` - Sobre la artista
- `/contact` - Contacto

## 🎯 Próximos Pasos

### 1. Personalizar Contenido
```bash
# Editar información del artista
vim web/config.toml

# Actualizar biografía
vim web/content/about.md

# Actualizar contacto
vim web/content/contact.md
```

### 2. Agregar Obras Reales

#### Método A: Script interactivo (recomendado)
```bash
cd web
./add-work.sh
# Seguir el asistente
# Luego copiar imagen a static/images/works/
```

#### Método B: Manual
```bash
# 1. Copiar imagen
cp ~/foto-obra.jpg web/static/images/works/mi-obra.jpg

# 2. Crear archivo
cat > web/content/works/mi-obra.md << 'EOF'
+++
title = "Título"
date = 2024-01-15
[extra]
series = "Serie"
medium = "Técnica"
dimensions = "100 x 150 cm"
year = 2024
image = "/images/works/mi-obra.jpg"
featured = true
+++

Descripción de la obra.
EOF
```

### 3. Inicializar Git
```bash
cd web
git init
git add .
git commit -m "Initial commit: Portfolio Carolina Vildósola"
```

Ver `GIT-SETUP.md` para workflow completo.

### 4. Preparar para Deploy

#### Actualizar base_url
Editar `config.toml`:
```toml
base_url = "https://carolinavildosola.com"  # o el dominio que uses
```

#### Deploy
Ver opciones en `DEPLOY.md`:
- **Netlify** (recomendado, auto-deploy desde Git)
- **Cloudflare Pages** (CDN global)
- **GitHub Pages** (gratuito)
- **Servidor propio** (VPS)

## 📋 Checklist de Lanzamiento

### Contenido
- [ ] Personalizar info en `config.toml`
- [ ] Actualizar `about.md` con bio real
- [ ] Actualizar `contact.md` con email real
- [ ] Eliminar obras de ejemplo
- [ ] Agregar obras reales (mínimo 6-9 para buen grid)
- [ ] Verificar todas las imágenes se ven bien

### Técnico
- [ ] Cambiar `base_url` al dominio final
- [ ] Inicializar Git
- [ ] Crear repo en GitHub/GitLab
- [ ] Push inicial
- [ ] Configurar deploy automático
- [ ] Probar sitio en producción
- [ ] Configurar dominio personalizado
- [ ] Verificar HTTPS funcionando

### SEO & Analytics (opcional)
- [ ] Agregar meta descriptions
- [ ] Configurar Google Analytics o Plausible
- [ ] Submit a Google Search Console
- [ ] Crear sitemap.xml (Zola lo genera automático)

## 🎨 Personalización Avanzada

### Cambiar colores
Editar `web/tailwind.config.js`:
```javascript
module.exports = {
  theme: {
    extend: {
      colors: {
        'brand': '#123456',  // tu color principal
      }
    }
  }
}
```

Luego: `npm run css:build`

### Cambiar tipografía
Editar `web/sass/input.css`:
```css
@layer base {
  body {
    font-family: 'Nombre de Fuente', sans-serif;
  }
}
```

### Agregar secciones nuevas
1. Crear archivo en `content/`
2. Crear template en `templates/` si es necesario
3. Agregar link en `templates/base.html` (nav)

## 🆘 Troubleshooting

### Servidor no levanta
```bash
./web/stop-server.sh  # detener cualquier instancia
./web/start-server.sh  # reiniciar
./web/status-server.sh  # verificar
```

### CSS no se actualiza
```bash
cd web
npm run css:build  # recompilar
# El servidor detecta cambios automáticamente
```

### Imagen no aparece
- Verificar ruta en .md: `/images/works/nombre.jpg`
- Verificar archivo existe en: `static/images/works/nombre.jpg`
- Nombre exacto (case-sensitive)

### Git merge conflicts
Ver `GIT-SETUP.md` sección "Resolver conflictos"

## 📚 Recursos

### Documentación
- [Zola Docs](https://www.getzola.org/documentation/)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [Markdown Guide](https://www.markdownguide.org/)

### Tutoriales creados
- `README.md` - Uso diario
- `DEPLOY.md` - Deploy a producción
- `GIT-SETUP.md` - Git workflow

### Herramientas útiles
- [ImageMagick](https://imagemagick.org/) - Optimizar imágenes
- [Squoosh](https://squoosh.app/) - Comprimir imágenes online
- [YAML Lint](https://www.yamllint.com/) - Validar YAML

## 🙋 Soporte

Si necesitas ayuda:
1. Revisar los archivos .md de documentación
2. Verificar logs: `tail -f web/zola.log`
3. Preguntar en [Zola Discord](https://discord.gg/zola)

## ✨ Diseño

El sitio está inspirado en portfolios minimalistas de artistas visuales:
- Grid limpio y espacioso
- Tipografía ligera (font-light)
- Espacios en blanco generosos
- Hover effects sutiles
- Navegación fixed en top
- Responsive mobile-first

**Principio:** El arte es lo principal, la interfaz es invisible.

---

**Creado:** 2026-02-06  
**Stack:** Zola + Tailwind CSS v4 + PostCSS  
**Servidor:** pot (192.168.0.204:1111)  
**Estado:** ✅ Listo para personalización y deploy
