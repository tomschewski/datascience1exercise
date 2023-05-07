getstructure() {
    cd "$1"
    array=()
    
while IFS=  read -r -d $'\0'; do
    ind=$2
    array+=("$REPLY")
    
    num=$(echo $REPLY | tr -cd '.' | wc -c)
    
    if ((num < 2)); then
    indent "Directory : $REPLY" $ind
    ind=$((ind+4))
    getstructure "$REPLY" $ind
    
    else
    indent "File : $REPLY" $ind
    fi
    
done < <(find -maxdepth 1 -not -name '.*' -print0)
cd ..
}

function indent () {
    string="$1"
    num_spaces=$2
   
    printf "%${num_spaces}s%s\n" '' "$string"
    
}

curpath=$(pwd)
cd ~
getstructure $curpath 0