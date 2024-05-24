CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

flutter build ios

# make folder, add .app then zip it and rename it to .ipa
mkdir -p Payload
mv ./build/ios/iphoneos/Runner.app Payload
zip -r -y Payload.zip Payload/Runner.app
mv Payload.zip Payload.ipa

# the following are options, remove Payload folder
rm -Rf Payload
# open finder and manually find the .ipa and upload to diawi using chrome

if [ $? -eq 0 ]; then
    echo "${CYAN}Quá trình build IPA thành công!${NC}"
else
    echo "${RED}Quá trình build IPA có lỗi. Vui lòng kiểm tra và sửa lỗi.${NC}"
    ./notify.sh 1 'IOS'
    exit 1
fi
