SOCK5_PORT=1080
SOCK5_HOST=127.0.0.1
IP=`ifconfig |grep "inet "|grep broadcast|awk '{print $2}'|cut -d/ -f1`

xhost + $IP

docker run --rm \
	--device /dev/net/tun \
	--cap-add NET_ADMIN \
	-v ~/.config/bvpn:/root \
	-e DISPLAY=$IP:0 \
	-e TYPE=x11 \
	-e EXIT=1 \
	-p $SOCK5_HOST:$SOCK5_PORT:$SOCK5_PORT \
	hagb/docker-easyconnect:vncless

xhost - $IP
