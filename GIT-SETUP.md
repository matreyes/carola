# Configuración de Git

## Inicialización del Repositorio

### 1. Inicializar Git
```bash
cd web
git init
```

### 2. Configurar usuario (si no está configurado)
```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"
```

### 3. Primer commit
```bash
git add .
git commit -m "Initial commit: Portfolio Carolina Vildósola"
```

### 4. Conectar con repositorio remoto

#### Opción A: GitHub
```bash
# Crear repo en github.com primero, luego:
git remote add origin git@github.com:usuario/carolinavildosola.git
git branch -M main
git push -u origin main
```

#### Opción B: GitLab
```bash
git remote add origin git@gitlab.com:usuario/carolinavildosola.git
git branch -M main
git push -u origin main
```

## Workflow Diario

### Agregar obra nueva
```bash
# 1. Crear obra con script helper
./add-work.sh

# 2. Copiar imagen
cp ~/Pictures/mi-obra.jpg static/images/works/obra-slug.jpg

# 3. Editar contenido si necesario
vim content/works/obra-slug.md

# 4. Verificar en navegador
# http://pot:1111

# 5. Commit
git add .
git status  # revisar cambios
git commit -m "Add: Título de la obra"
git push
```

### Actualizar obra existente
```bash
# Editar archivo
vim content/works/obra-existente.md

# O reemplazar imagen
cp ~/nueva-imagen.jpg static/images/works/obra-existente.jpg

# Commit
git add content/works/obra-existente.md  # o la imagen
git commit -m "Update: Obra existente - descripción del cambio"
git push
```

### Actualizar info del sitio
```bash
# Editar config
vim config.toml

# O página About
vim content/about.md

# Commit
git add config.toml content/about.md
git commit -m "Update: Información del artista"
git push
```

### Actualizar estilos
```bash
# Editar CSS
vim sass/input.css

# Recompilar
npm run css:build

# Commit
git add sass/input.css static/style.css
git commit -m "Style: Descripción del cambio visual"
git push
```

## Comandos Git Útiles

### Ver estado
```bash
git status          # Archivos modificados
git diff            # Ver cambios línea por línea
git log --oneline   # Historial resumido
```

### Deshacer cambios
```bash
git checkout -- archivo.md     # Descartar cambios de un archivo
git reset HEAD archivo.md      # Des-stagear un archivo
git reset --soft HEAD~1        # Deshacer último commit (mantener cambios)
```

### Ramas (para experimentar)
```bash
git checkout -b nueva-feature   # Crear rama nueva
git checkout main               # Volver a main
git merge nueva-feature         # Fusionar cambios
```

### Ver diferencias entre commits
```bash
git diff HEAD~1 HEAD           # Comparar último commit con anterior
git show COMMIT_HASH           # Ver un commit específico
```

## Buenas Prácticas

### Mensajes de commit claros
```bash
# ✅ Bueno
git commit -m "Add: Obra 'Composición Azul'"
git commit -m "Update: Biografia en página About"
git commit -m "Fix: Link roto en navegación"

# ❌ Malo
git commit -m "cambios"
git commit -m "update"
git commit -m "asdfasdf"
```

### Prefijos recomendados
- `Add:` - Agregar contenido nuevo
- `Update:` - Actualizar contenido existente
- `Fix:` - Corregir error
- `Style:` - Cambios visuales/CSS
- `Docs:` - Actualizar documentación

### Commits atómicos
Hacer commits pequeños y enfocados:
```bash
# ✅ Bueno - varios commits pequeños
git add content/works/obra-1.md static/images/works/obra-1.jpg
git commit -m "Add: Obra 1"

git add content/works/obra-2.md static/images/works/obra-2.jpg
git commit -m "Add: Obra 2"

# ❌ Malo - un commit gigante
git add .
git commit -m "Agregadas 10 obras y cambios varios"
```

### Ignorar archivos
Ya está configurado en `.gitignore`, pero puedes agregar más:
```bash
echo "archivo-temporal.txt" >> .gitignore
git add .gitignore
git commit -m "Docs: Update gitignore"
```

## Colaboración

### Si trabajan varias personas

#### Antes de hacer cambios
```bash
git pull  # Obtener últimos cambios
```

#### Resolver conflictos
Si git dice "conflict":
```bash
# 1. Abrir archivos en conflicto (marcados con <<<<<<)
vim archivo-con-conflicto.md

# 2. Elegir qué cambios mantener
# 3. Eliminar marcadores <<<<<<<, =======, >>>>>>>
# 4. Guardar

# 5. Marcar como resuelto
git add archivo-con-conflicto.md
git commit -m "Merge: Resolver conflicto en archivo"
```

## Backup

Aunque Git es distribuido (cada clon es un backup), es buena práctica:

```bash
# Push regularmente
git push

# O crear backup local
git clone web/ web-backup-$(date +%Y%m%d)
```

## Recursos

- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)
- [Learn Git Branching](https://learngitbranching.js.org/) - Tutorial interactivo
- [Oh Shit Git](https://ohshitgit.com/) - Cómo arreglar errores comunes
