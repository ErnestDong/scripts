export PATH=/usr/local/bin:$PATH
# URL=$(curl "https://bing.biturl.top/?resolution=1920&format=json&index=0&mkt=zh-CN" | jq -r '.url')
URL=$(curl "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-CN" | jq -r '.images[].url')
echo $URL
date=$(date +%Y-%m-%d)
FILEPATH=~/Pictures/bing-wallpaper/$date.jpg
curl http://bing.com$URL -o $FILEPATH
osascript -e 'tell application "System Events" to tell every desktop to set picture to "'$FILEPATH'"'
