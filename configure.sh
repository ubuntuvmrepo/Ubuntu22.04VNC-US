#configure.sh VNC_PASSWORD NGROK_AUTH_TOKEN

#Enable VNC
sudo apt update
sudo apt install lxqt tightvncserver -y
mkdir -p $HOME/.vnc
echo $1
echo $2
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
