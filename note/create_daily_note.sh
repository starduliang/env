TIMESTAMP=$(date +'%y%m%d')
TARGET_DIR='/home/liang/work/projects/liang_notes'
TARGET_FILE=${TARGET_DIR}/${TIMESTAMP}.md
FROM_FILE=${TARGET_DIR}/系统/system_core.md

FILE=/etc/resolv.conf
if test -f "$TARGET_FILE"; then
    echo "$TARGET_FILE exists."
else
    sed -n '1,34p' $FROM_FILE > $TARGET_FILE
    echo file created: ${TARGET_FILE}
fi


