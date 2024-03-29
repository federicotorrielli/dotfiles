# Welcome to my heavily customized fish file by EvilScript

# Let's start with lsd instead of ls
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

#xcp instead of cp
alias cp='xcp'

#bat instead of cat
alias cat='bat'

#fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upqll='paru'

#7z instead of unzip
alias 7zarchive='7z a archiv.7z -m1=lz4 -mx22'

#git-delta instead of diff
alias diff='delta'

#set bat as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

#bpytop
alias top='bpytop'

#remove and uninstall neovim config
alias rmnvim='rm -rf ~/.config/nvim/ ~/.cache/nvim ~/.local/share/nvim/ ~/.local/share/lunarvim/ ~/.config/lvim/'

#colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#wolframalpha
alias wa='tungsten'

#readable output
alias df='df -h'

#show my external ip
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias mydns='dig evilscript.altervista.org | grep ";; SERVER" | cut -d "(" -f2 | cut -d ")" -f1'

#printer
alias print='lp -d Brother_HL-L3270CDW_series'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#arcolinux logout unlock
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"

#free
alias free="free -mt"

#use all cores
alias uac="sh ~/.bin/main/000*"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

#aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
alias skel='cp -Rf ~/.config ~/.config-backup-(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/skel/* ~'
#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-(date +%Y.%m.%d-%H.%M.%S)'

#copy bashrc-latest over on bashrc - cb= copy bashrc
alias cb='sudo cp /etc/skel/.bashrc ~/.bashrc && source ~/.bashrc'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /usr/bin/fish && echo 'Now log out.'"

#nvim is better than vim
alias vim='nvim'

#ripgrep instead of grep
alias grep='rg'

#diskonaut
alias ncdu='diskonaut'

#broot instead of tree
alias tree='br'

#quickly kill conkies
alias kc='killall conky'

#pinta as paint
alias paint='pinta'

#hardware info --short
alias hw="hwinfo --short"

#skip integrity check
alias trizenskip='trizen -S --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias mirrorx="sudo reflector --age 6 --latest 20 --fastest 20 --threads 20 --sort rate -c it,fr --protocol https --save /etc/pacman.d/mirrorlist"

#user installed packages and dependencies (fish edition)
alias uipd='pacman -Qqe | grep -v "(pacman -Qqm)" > pacman.lst'
#user installed packages w/o dependencies
alias uia='pacman -Qqm > pacman-user.lst'

#compress-pdf
alias pdfzip='gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=compressed.pdf '

#yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "

#recent Installed Packages
alias ripa="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
alias bigpackages="pacman -Qi | egrep '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | bat"

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Update everything and cleanup
alias update='mirrorx && paru && paru -Sc && cleanup'
#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#roll a 6 dice
alias roll="rolldice 6"

#know your bios version!
alias biosversion="sudo dmidecode -t bios | grep 'Version' | cut -d ' ' -f 2" 

#nano for important configuration files
#know what you do in these files
alias nlightdm="sudo nano /etc/lightdm/lightdm.conf"
alias npacman="sudo nano /etc/pacman.conf"
alias ngrub="sudo nano /etc/default/grub"
alias nmkinitcpio="sudo nano /etc/mkinitcpio.conf"
alias nslim="sudo nano /etc/slim.conf"
alias noblogout="sudo nano /etc/oblogout.conf"
alias nmirrorlist="sudo nano /etc/pacman.d/mirrorlist"
alias nconfgrub="sudo nano /boot/grub/grub.cfg"
alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://bike.seedhost.eu/arcolinux/"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"

#cmatrix
alias cmatrix="cmatrix -a"

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

#human rsync as ncp
alias ncp="rsync -vazP"

#add python3 pip path here
set PATH /home/evilscript/.local/bin $PATH

#start the ssh agent
fish_ssh_agent
starship init fish | source
zoxide init fish | source
alias cd=z

if status is-interactive
  cbonsai -p
end
