#!/bin/bash

wgeturl="`date`.html"
search="`echo $@ |sed 's/ /+/g'`"
wget "http://www.imdb.com/find?s=all&q=$search" -qO "$wgeturl"
tt="`cat "$wgeturl" |grep -m1 -oE "tt[0-9]{7}" |grep -m1 -E "(.*)"`"
rm "$wgeturl"
wget "http://www.imdb.com/title/$tt/" -qO "$tt.html"

title="`cat $tt.html |pcregrep -oMi "<title>(.*)</title>" |sed 's/<title>//g' |sed 's/<\/title>//g' | tr -d '\n' |sed 's/ -
IMDb//' |sed 's/\ / /'`"
plot="`cat $tt.html |grep -E "<p>(.*)" -m 2 |sed 's/<p>//g' |tr -d '\n'`"
genre="`cat $tt.html |grep -oE '\/genre\/[a-zA-Z]+\"' |cut -d '/' -f3 |sed 's/\"$/ /' |sort |uniq |tr -d '\n'`"
language="`cat $tt.html |grep '\/language\/' |cut -d '>' -f2 |sed 's/<\/a//'`"
country="`cat $tt.html |grep '\/country\/' |cut -d '>' -f2 |sed 's/<\/a//'`"
keyword="`cat $tt.html |grep '\/keyword\/' |sed 's/<[^>]*>//g' |sed 's/\ / /'`"
rm "$tt.html"

if [[ "$tt" != "" ]]; then echo "http://www.imdb.com/title/$tt" ;fi
if [[ "$title" != "" ]]; then echo "Title: $title" ;fi
if [[ "$keyword" != "" ]]; then echo "Keyword: $keyword" ;fi
if [[ "$plot" != "" ]]; then echo "Plot: $plot" ;fi
if [[ "$genre" != "" ]]; then echo "Genre(s): $genre" ;fi
if [[ "$language" != "" ]]; then echo "Language: $language" ;fi
if [[ "$country" != "" ]]; then echo "Country: $country" ;fi
