#define function for recursion
getstructure() {
    #ensuring that we cd to right directory, necessary if you would use script when not in same folder
    cd "$1"
    
#while loop to loop through everything found by 'find' command
while IFS=  read -r -d $'\0'; do
    #making sure the indent lenght is right by redefining it every loop
    ind=$2
    #checking how many dots the current string contains 
    num=$(echo $REPLY | tr -cd '.' | wc -c)
    
    #if number of dots in string is less then 2 we call the function with the new found subdirectory
    if ((num < 2)); then
    indent "Directory : $REPLY" $ind
    ind=$((ind+4)) #adjusting identlenght for new instance of function
    getstructure "$REPLY" $ind
    
    #if more than one dot it's a file and we just print
    else
    indent "File : $REPLY" $ind
    fi
    
done < <(find -maxdepth 1 -not -name '.*' -print0)
cd .. #ensuring we cd back into proper directory after each instance
}

#formating function for proper indents
function indent () {
    string="$1"
    num_spaces=$2
   
    printf "%${num_spaces}s%s\n" '' "$string"
    
}

curpath=$(pwd)
cd ~
getstructure $curpath 0