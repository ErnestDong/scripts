export PATH=/usr/local/bin:$PATH
# URL=$(curl "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY" | jq -r '.hdurl')
# echo $URL
year=$(gdate --date yesterday +%Y)
date=$(gdate --date yesterday +%y%m%d)
FILEPATH=~/Pictures/wallpaper/$date.jpg
URL="https://apod.cidehom.com/pix/$year/$date.jpg"
curl $URL -o $FILEPATH
osascript -e 'tell application "System Events" to tell every desktop to set picture to "'$FILEPATH'"'

