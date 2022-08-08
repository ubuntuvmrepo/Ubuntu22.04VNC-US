#configure.sh VNC_PASSWORD NGROK_AUTH_TOKEN

#Enable VNC
wget "http://tigervnc.bphinz.com/nightly/ubuntu-20.04LTS/amd64/tigervncserver_1.12.80+20220801git07d4e290-1ubuntu1_amd64.deb" -O tigervncserver.deb
sudo apt update
sudo apt install ./tigervncserver.deb -y
sudo apt --fix-broken install -y
mkdir -p $HOME/.vnc
vncpasswd -f <<< $1 > "$HOME/.vnc/passwd"

#Start VNC/reset changes
vncserver

#install ngrok
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list
sudo apt update
sudo apt install ngrok -y

#configure ngrok and start it
ngrok authtoken $2
ngrok tcp 5900 &
