#!/bin/bash
echo "Preparing to convert songs to ringtones ..."

if [ $2 ];
then
    cd "$2"
fi

if [ $1 ];
then
	dest="$1"
else
	dest="."
fi

echo "Beginning conversion ..."

for f in *.mp3;
do
    echo "Converting $f ..."
    nf="$dest/${f%.*} (Ringtone).mp3"
    avconv -i "$f" -t 40 -fs 1000000 "$nf"
    id3v2 -g "Ringtone" "$nf"
    echo "Conversion was successful; created file $nf"
done

echo "All music files were successfully converted."
