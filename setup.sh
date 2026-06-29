#!/bin/bash

set -u

# Setup script voor nieuwe installaties. Script zou hufter-proof genoeg moeten
# zijn om meerdere keren uit te voeren. De volgende stappen worden gedaan:
#
# - Flatpak
#   - Verwijder de fedora remote, gebruiken alleen flathub
#   - Installeer de nodige packages
# - Installeer dependencies die we niet met flatpak willen
# - Symlink de dotfile config  folders naar de juiste plek
function main {
    # Zorg dat we in de juiste folder zitten
    cd $(dirname $0)

    if [[ $(basename $(pwd)) != "dotfiles" ]]; then
        echo "Geen script call maar een pipe naar bash. Check de dotfiles repo uit..."
 
        # We zitten niet in de dotfiles folder. Dit kan gebeuren wanneer we dit
        # script via bash instellen. Zorg dat de dotfiles repo met een `git clone`
        # wordt gedownload en voer daarna de stappen uit.
        if [[ ! -d ~/dotfiles ]]; then
            cd ~
            git clone https://github.com/nielsdekker/dotfiles.git
            
            cd ~/dotfiles
            git remote set-url origin git@github.com:nielsdekker/dotfiles.git
        else
            cd ~/dotfiles
        fi
    fi

    log ""
    log "Huidige directory: $(pwd)"
	log "- Commando's worden allemaal vanuit \"$(dirname $0)\" folder uitgevoerd"
	log "- Aantal commands zullen \"sudo\" gebruiken dus verwacht een password prompt"
	log "- rpm-ostree wordt gebruikt voor het installeren van packages"

	setup_packages
	setup_flatpak
	setup_gnome
	setup_tlbx
	setup_config
    install_fonts

    log "En klaar :)"
}


function setup_flatpak {
	log "Schakel fedora uit en zet alles op de flathub remote"
	sudo flatpak remote-modify --no-filter --enable flathub
	TO_REINSTALL=$(flatpak list --app-runtime=org.fedoraproject.Platform --columns=application | tail -n +1)
	if [[ -n $TO_REINSTALL ]]; then
		flatpak install -y --user --reinstall flathub $TO_REINSTALL
	fi
	sudo flatpak remote-modify --no-filter --disable fedora fedora-testing

	log "Installeer minimale software"
	flatpak install --user -y \
		be.alexandervanhee.gradia \
		com.github.marhkb.Pods \
		com.github.tchx84.Flatseal \
		com.mattjakeman.ExtensionManager \
		org.mozilla.firefox \
        ca.desrt.dconf-editor
}

function setup_packages {
	log "Verwijder standaard packages die we niet gebruiken"

	# Firefox komt mee met de flatpak
	rpm-ostree override remove -y firefox firefox-langpacks

	# Installeer alle packages
	rpm-ostree install \
		neovim \
		fzf \
	    ripgrep \
        cava \
        gnome-tweaks
}

function setup_gnome {
	log "Installeer extensies, pop-up per extensie want yay?"

    install_gnome_extension "user-accent-colors@fabito02"
	install_gnome_extension "dynamic-music-pill@andbal"
	install_gnome_extension "blur-my-shell@aunetx"
	install_gnome_extension "AlphabeticalAppGrid@stuarthayhurst"

    log "Zet wallpapers in ~/.local/share/backgrounds/"
    mkdir -p ~/.local/share/backgrounds
    for WP in $(/bin/ls wallpapers); do
        cp wallpapers/$WP ~/.local/share/backgrounds/$WP
    done

    log "Setup alle gnome dconf data"
    dconf load / < gnome/gnome.ini
    dconf load / < gnome/extensions.ini
}

function setup_config {
    # Nvim
    if [[ ! -d "$HOME/.config/nvim/" ]]; then
        log "Link nvim config folder (~/.config/nvim -> dotfiles/nvim)"
        ln -s "$(pwd)/nvim/" "$HOME/.config/nvim"
    fi

    # Ghostty
    if [[ ! -d "$HOME/.var/app/com.mitchellh.ghostty/config/ghostty/" ]]; then
        log "Link ghostty config folder (~/.var/app/com.ghostty/config/ghostty -> dotfiles/ghostty)"
        mkdir -p "$HOME/.var/app/com.mitchellh.ghostty/config/"
        ln -s "$(pwd)/ghostty/" "$HOME/.var/app/com.mitchellh.ghostty/config/ghostty"
    fi

    # .Bashrc is een directe link
    rm ~/.bashrc
    ln -s $(pwd)/bash/bashrc ~/.bashrc
}

function install_fonts {
    if [[ ! -f ~/.local/share/fonts/Iosevka-Regular.ttc ]]; then
        curl -L "https://github.com/be5invis/Iosevka/releases/download/v34.6.3/PkgTTC-Iosevka-34.6.3.zip" -o iosevka.zip
        unzip iosevka.zip -d ~/.local/share/fonts/
        rm iosevka.zip
    fi
}

function install_gnome_extension {
    NAME=$1

    if [[ ! -d ~/.local/share/gnome-shell/extensions/$NAME ]]; then
		gnome-browser-connector "gnome-extensions://${NAME//@/%40}/?action=install"
    fi
}

function log {
	printf "\033[0;32m$1\033[0m\n"
}

function warn {
	printf "\033[0;31m$1\033[0m\n"
}

main
