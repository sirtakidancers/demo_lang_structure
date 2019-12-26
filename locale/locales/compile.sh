#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DATE=$(date +%s)
FILENAME="messages_"${DATE}".mo"

printf "\nDeleting old *.mo files from git...\n"
find ${DIR} -iname '*.mo' -exec git rm --force {} \;

printf "\nCompiling *.mo files...\n"
msgfmt -c ${DIR}/ru_RU/LC_MESSAGES/messages.po -o ${DIR}/ru_RU/LC_MESSAGES/${FILENAME}
msgfmt -c ${DIR}/en_US/LC_MESSAGES/messages.po -o ${DIR}/en_US/LC_MESSAGES/${FILENAME}
msgfmt -c ${DIR}/es_ES/LC_MESSAGES/messages.po -o ${DIR}/es_ES/LC_MESSAGES/${FILENAME}
msgfmt -c ${DIR}/ch_CH/LC_MESSAGES/messages.po -o ${DIR}/ch_CH/LC_MESSAGES/${FILENAME}

printf "\nAdding new *.mo files to git...\n"
find ${DIR} -iname '*.mo' -exec git add {} \;

printf ${DATE} > ${DIR}/version.txt
printf "\nNew version: "${DATE}
printf "\nDone.\n"

