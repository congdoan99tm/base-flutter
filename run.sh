# chmod +x {fileName}.sh

COMMIT='second Commit'

# Phân tách commit ra các gạch đầu dòng bằng dấu ';'
# RELEASE_NOTE=$(echo "$COMMIT" | tr ';' '\n' | sed -e 's/^/- /' -e 's/$/./')
# RELEASE_NOTE=$(echo "$COMMIT" | sed -e 's/; */.\n- /g' -e 's/^/- /')
RELEASE_NOTE=$(echo "$COMMIT" | sed -e 's/; */.\n- /g' -e 's/\[/\\[/g' -e 's/\]/\\]/g' -e 's/^/- /' | sed 's/\\//g')
echo "$RELEASE_NOTE"

./tools/git_push.sh "$COMMIT"

# ./tools/apk_generator.sh || exit 1
# ./tools/deploygate.sh "ANDROID" "$RELEASE_NOTE"  || exit 1
# ./tools/notify.sh "ANDROID" "$RELEASE_NOTE" || exit 1

# ./tools/ipa_generator.sh  || exit 1
# ./tools/deploygate.sh "IOS" "$RELEASE_NOTE"  || exit 1
# ./tools/notify.sh "IOS" "$RELEASE_NOTE" || exit 1


