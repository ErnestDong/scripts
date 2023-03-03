export PATH=/usr/local/bin:$PATH
URL=$(curl "https://bing.biturl.top/?resolution=1920&format=json&index=0&mkt=zh-CN" | jq -r '.url')
echo $URL
date=$(date +%Y-%m-%d)
FILEPATH=~/Pictures/bing-wallpaper/$date.jpg
curl $URL -o $FILEPATH
osascript -e 'tell application "System Events" to tell every desktop to set picture to "'$FILEPATH'"'
