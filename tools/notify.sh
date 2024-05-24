TELEGRAM_BOT_TOKEN="06265560407:AAHcP3cOCoVJQcDVFrrP3e0tHi3hmi-S7ME"
TELEGRAM_CHAT_ID="-4066221928" #myGR= -4083608011 #mobileGR = -4066221928
USER_USERNAME='changg27'
TESTER_ID="253513711"
DEV_ID="1253513711"
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'
APK_LINK="https://deploygate.com/organizations/congdoan/platforms/android/apps/com.dinos.app"
IPA_LINK="https://deploygate.com/organizations/congdoan/platforms/ios/apps/com.dinos.dinosapp"

if [ "$1" = "ANDROID" ]; then
    LINK=$APK_LINK
elif [ "$1" = "IOS" ]; then
    LINK=$IPA_LINK
fi

BUILD_ERROR="❌ Build $2 lỗi rồi!!! 
<a href=\"tg://user?id=$DEV_ID\">Đại ca</a> build lại đi."

DEPLOY_ERROR="❌ Deploy $2 lỗi rồi!!! 
<a href=\"tg://user?id=$DEV_ID\">Đại ca</a> deploy lại đi."

RELEASE_NOTE="🚀 *New Release Available* 🚀
Triệu hồi [@$USER_USERNAME](tg://user?id=$TESTER_ID) vào tét app.

**Download Link:** [$1]($LINK)

*Release Notes:*
$2"


if [ "$1" -eq 1 ]; then
     PARSE_MODE="HTML"
     MESSAGE=$BUILD_ERROR
elif [ "$1" -eq 2 ]; then
     PARSE_MODE="HTML"
     MESSAGE=$DEPLOY_ERROR
else
      PARSE_MODE="Markdown"
      MESSAGE=$RELEASE_NOTE
fi

echo "${YELLOW}Send Nude...${NC}"

response=$(curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
     -d "chat_id=$TELEGRAM_CHAT_ID" \
     -d "text=$MESSAGE" \
     -d "parse_mode=$PARSE_MODE")

# Kiểm tra xem response có chứa "ok":true không
if [[ $response == *"\"ok\":true"* ]]; then
    echo "\n${CYAN}Đã gửi${NC}"
else
    echo "${RED}Gửi tin nhắn thất bại.
$response${NC}"
   exit 1
fi
