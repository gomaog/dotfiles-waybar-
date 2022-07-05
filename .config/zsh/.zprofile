emulate sh -c 'source /etc/profile'

export VISUAL=nvim
export EDITOR=nvim
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland-egl
export SDL_VIDEODRIVER=wayland
export PATH="$HOME/bin:$PATH"

# setting it in profile perfectly suits usecase (needed for theme)
export DEFAULT_USER="$(whoami)"

if [ -z "$XDG_RUNTIME_DIR" ]; then
	export XDG_RUNTIME_DIR="/tmp/$UID-runtime-dir"
	if ! [ -d "$XDG_RUNTIME_DIR" ]; then
		mkdir "$XDG_RUNTIME_DIR"
		chmod 0700 "$XDG_RUNTIME_DIR"
	fi
fi

if [ "$(tty)" = "/dev/tty1" ]; then
	if [ "$(command -v sway)" ]; then
		exec sway >/tmp/sway.log 2>&1
	fi	
	if [ "$(command -v startx)" ]; then
		exec startx
	fi
fi
