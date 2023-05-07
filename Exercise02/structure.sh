getstructure() {
    ind=$2
    cd "$1"
    array=()
    
while IFS=  read -r -d $'\0'; do
    array+=("$REPLY")
    
    num=$(echo $REPLY | tr -cd '.' | wc -c)
    
    if ((num < 2)); then
    echo DIRECTORY : $REPLY
    getstructure "$REPLY"
    
    else
    echo FILE : $REPLY
    fi
    
done < <(find -maxdepth 1 -not -name '.*' -print0)
cd ..
}

curpath=$(pwd)
cd ~
getstructure $curpath 0