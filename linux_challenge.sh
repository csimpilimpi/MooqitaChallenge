#!/bin/bash
#defining the pool of characters to be used

pool="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

# defining the maximum size of the file in bytes
file_max=$((2 ** 20))

# Save original directory so that we can return to it 
orig_dir=$(pwd)

# check to make sure it doesn't already exists

if [[ -d linuxchallenge ]] ; then
    echo "linuxchallenge already exists, do you want to overwrite it (y or n)?"
    read answer
    [[ $answer != y ]] && echo aborting  && exit
    rm -r linuxchallenge
fi

mkdir linuxchallenge
cd linuxchallenge
touch file1

file_size=0

# filling up file1 with words

while [ $file_size -le $file_max ]
do
    # each word will be randomly between 1 and 15 characters long
    line_len=$(($RANDOM%15+1))
    word=""
    # adding one random character from the pool of characters to the word in each loop
    for ((i=1;i<=line_len; i++))
    do
        pos=$(($RANDOM%62))
        word=$word${pool:$pos:1}
    done
    echo $word >> file1
    file_size=$(stat -c%s "file1")
done

echo "file1 of size $file_size byte(s) was created under linuxchallenge."

sort -o file1 file1

echo "sorted and saved file1."

totalwords=$(cat file1 | wc -l)
grep -v -i ^a file1 > file2
remainingwords=$(cat file2 | wc -l)
deletedwords=$(($totalwords - $remainingwords))

echo "removed all lines that start with a or A and saved the result in file2." 

if [ $deletedwords -eq 1 ] ; then
    echo "One word was deleted."
else
    echo "$deletedwords words were deleted."
fi

cd $orig_dir
