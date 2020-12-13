#!/bin/bash
# decompress data
find `pwd` -mindepth 1 -maxdepth 1 -type d | while read -r DIR; do
    pushd "$DIR" >/dev/null && { # go to the directory $DIR
        NAME=$(ls *_info.txt.gz)
        echo $NAME
        gunzip "${NAME}"

        NAME=$(ls *.txt.gz)
        echo $NAME
        gunzip "${NAME}"
        popd >/dev/null
    }
done

# 1. `pwd` is to eval the pwd datapath
# 2. while read -r DIR: read the DIR subfiles untile EOF
# 3. pushd "$DIR" >/dev/null: push the directory $DIR into stack. ANd then popd to the original directory. >/dev/null means do not give any hints
# 4. =$(ls *_info.txt.gz) means eval the file end with _info.txt.gz. Remember we already enter into the $DIR now, not in original dir.

