# Guía de Despliegue

## Opción 1: Netlify (Recomendado)

### Primera vez
1. Crear cuenta en [Netlify](https://netlify.com)
2. Conectar repositorio Git
3. Configurar build:
   - **Build command:** `zola build`
   - **Publish directory:** `public`
   - **Environment variables:**
     - `ZOLA_VERSION` = `0.18.0` (o última)

### Dominio personalizado
1. En Netlify: Domain Settings
2. Agregar custom domain: `carolinavildosola.com`
3. Configurar DNS según instrucciones

### Deploy automático
- Cada `git push` a main → deploy automático
- Preview deploys para otras ramas

## Opción 2: Cloudflare Pages

### Primera vez
1. Crear cuenta en [Cloudflare Pages](https://pages.cloudflare.com)
2. Conectar repositorio
3. Configurar:
   - **Framework preset:** Zola
   - **Build command:** `zola build`
   - **Build output:** `public`

### Ventajas
- CDN global gratuito
- HTTPS automático
- DNS integrado

## Opción 3: GitHub Pages

### Setup
```bash
# En web/
../zola build
cd public
git init
git remote add origin git@github.com:usuario/usuario.github.io.git
git add .
git commit -m "Deploy"
git push -u origin main
```

Sitio en: `https://usuario.github.io`

### Deploy script
```bash
#!/bin/bash
../zola build
cd public
git add -A
git commit -m "Deploy $(date)"
git push
```

## Opción 4: Servidor Propio (VPS)

### Requisitos
- VPS con SSH
- Nginx o Apache
- Certbot (para HTTPS)

### Deploy manual
```bash
# Local
zola build
rsync -avz public/ usuario@servidor:/var/www/carolinavildosola/

# Servidor (primera vez)
sudo certbot --nginx -d carolinavildosola.com
```

### Deploy automático (GitHub Actions)
Crear `.github/workflows/deploy.yml`:
```yaml
name: Deploy

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Install Zola
        run: |
          wget -q https://github.com/getzola/zola/releases/download/v0.18.0/zola-v0.18.0-x86_64-unknown-linux-gnu.tar.gz
          tar xzf zola-v0.18.0-x86_64-unknown-linux-gnu.tar.gz
          sudo mv zola /usr/local/bin/
      
      - name: Build
        run: zola build
      
      - name: Deploy
        uses: easingthemes/ssh-deploy@v2
        env:
          SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
          REMOTE_HOST: ${{ secrets.REMOTE_HOST }}
          REMOTE_USER: ${{ secrets.REMOTE_USER }}
          TARGET: /var/www/carolinavildosola/
          SOURCE: public/
```

## Configuración DNS

### Para cualquier opción necesitas:

**Registrar:** `carolinavildosola.com` en un registrador (ej: Namecheap, GoDaddy)

**Configurar DNS:**
- Netlify/Cloudflare: Te dan nameservers
- Servidor propio:
  ```
  A     @    IP_DEL_SERVIDOR
  CNAME www  carolinavildosola.com
  ```

## Checklist Pre-Deploy

- [ ] Actualizar `base_url` en `config.toml` al dominio final
- [ ] Verificar todas las imágenes existen
- [ ] Probar build local: `zola build`
- [ ] Revisar `public/` generado
- [ ] Configurar analytics (opcional: Google Analytics, Plausible)
- [ ] Configurar formulario de contacto si aplica

## Mantenimiento

### Actualizar contenido
```bash
# Agregar obra
./add-work.sh

# Commit
git add .
git commit -m "Add: Nueva obra"
git push
```

### Actualizar estilos
```bash
# Editar sass/input.css
npm run css:build
git add static/style.css
git commit -m "Update styles"
git push
```

## Performance

### Optimizar imágenes antes de subir
```bash
# Instalar ImageMagick
brew install imagemagick  # macOS
sudo apt install imagemagick  # Linux

# Optimizar imagen
convert input.jpg -quality 85 -resize 1200x output.jpg
```

### Lazy loading
Las imágenes ya tienen lazy loading en los templates.

## Monitoreo

Herramientas recomendadas:
- **Uptime:** UptimeRobot (gratuito)
- **Analytics:** Plausible, Fathom (privacidad-first)
- **Performance:** Google PageSpeed Insights
