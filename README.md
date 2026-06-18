# dotfiles — bspwm

Configuración de entorno gráfico minimalista sobre Debian 13 (trixie).

## Stack

| Componente | Herramienta |
|---|---|
| Window manager | bspwm |
| Hotkey daemon | sxhkd |
| Terminal | kitty |
| Lanzador | rofi |
| Barra | polybar |
| Tema de cursor | DMZ-White |

## Instalación

```sh
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
startx
```

> Requiere acceso root. Probado en Debian 13 (trixie) con Xorg.

## Estructura

```
dotfiles/
├── .config/
│   ├── bspwm/bspwmrc         # configuración y autostart
│   ├── sxhkd/sxhkdrc         # atajos de teclado
│   ├── polybar/
│   │   ├── config.ini         # barra: escritorios, fecha, volumen, cpu, ram
│   │   └── launch.sh          # script de arranque de polybar
│   ├── kitty/kitty.conf       # terminal con tema Claude
│   └── rofi/config.rasi       # lanzador de aplicaciones
├── .Xresources                # cursor DMZ-White
├── .xinitrc                   # arranca bspwm con startx
└── install.sh                 # instala dependencias y despliega configs
```

---

## Atajos de teclado

> `Super` = tecla Windows

### Aplicaciones

| Atajo | Acción |
|---|---|
| `Super + Enter` | Abrir terminal (kitty) |
| `Super + Space` | Lanzador de aplicaciones (rofi) |

### bspwm — ventanas

| Atajo | Acción |
|---|---|
| `Super + W` | Cerrar ventana |
| `Super + Shift + W` | Matar ventana (forzar) |
| `Super + F` | Pantalla completa |
| `Super + S` | Flotante |
| `Super + T` | Tiled (mosaico) |
| `Super + Shift + T` | Pseudo-tiled |
| `Super + M` | Alternar layout monocle |
| `Super + G` | Intercambiar con la ventana más grande |
| `Super + Y` | Enviar ventana marcada al nodo preseleccionado |

### bspwm — foco

| Atajo | Acción |
|---|---|
| `Super + H` | Foco izquierda |
| `Super + J` | Foco abajo |
| `Super + K` | Foco arriba |
| `Super + L` | Foco derecha |
| `Super + ←↓↑→` | Foco (flechas) |

### bspwm — mover ventana

| Atajo | Acción |
|---|---|
| `Super + Shift + H` | Mover ventana a la izquierda |
| `Super + Shift + J` | Mover ventana abajo |
| `Super + Shift + K` | Mover ventana arriba |
| `Super + Shift + L` | Mover ventana a la derecha |
| `Super + Shift + ←↓↑→` | Mover ventana (flechas) |

### bspwm — escritorios

| Atajo | Acción |
|---|---|
| `Super + 1-9` | Ir al escritorio 1–9 |
| `Super + 0` | Ir al escritorio 10 |
| `Super + Shift + 1-9` | Mover ventana al escritorio 1–9 |
| `Super + Shift + 0` | Mover ventana al escritorio 10 |

### bspwm — sistema

| Atajo | Acción |
|---|---|
| `Super + Alt + Q` | Salir de bspwm |
| `Super + Alt + R` | Reiniciar bspwm |
| `Super + Escape` | Recargar sxhkd |

### Kitty — terminal

| Atajo | Acción |
|---|---|
| `Ctrl + Shift + C` | Copiar |
| `Ctrl + Shift + V` | Pegar |
| `Ctrl + Shift + ↑ / ↓` | Scroll línea a línea |
| `Ctrl + Shift + PgUp / PgDn` | Scroll página a página |
| `Ctrl + Shift + Home` | Ir al inicio del historial |
| `Ctrl + Shift + End` | Ir al final del historial |
| `Ctrl + Shift + T` | Nueva pestaña |
| `Ctrl + Shift + Q` | Cerrar pestaña |
| `Ctrl + Shift + → / ←` | Cambiar pestaña |
| `Ctrl + Shift + Enter` | Nueva ventana (split) |
| `Ctrl + Shift + + / -` | Aumentar / reducir fuente |
| `Ctrl + Shift + Backspace` | Restaurar tamaño de fuente |

### Volumen (teclas multimedia)

| Atajo | Acción |
|---|---|
| `XF86AudioRaiseVolume` | Subir volumen +5% |
| `XF86AudioLowerVolume` | Bajar volumen -5% |
| `XF86AudioMute` | Silenciar / activar |

> Para activar las teclas de volumen agrega esto a `~/.config/sxhkd/sxhkdrc`:
> ```
> XF86AudioRaiseVolume
>     amixer set Master 5%+
> XF86AudioLowerVolume
>     amixer set Master 5%-
> XF86AudioMute
>     amixer set Master toggle
> ```

---

## Tema de colores — Claude

| Rol | Color |
|---|---|
| Fondo | `#0d0f17` |
| Texto | `#e2e4f0` |
| Acento naranja | `#d97706` |
| Acento azul | `#213882` |
| Verde | `#56c490` |
| Rojo | `#e06c75` |
| Lila | `#8b5cf6` |
