for file in `ls *.html`; do
  echo -n "  \"" > files-info/$file.info

  echo -n `grep "ContentPlaceHolder2_labelTitle" $file` | sed -e 's/.*">//g' | sed -e 's/<\/span>//g' >> files-info/$file.info
  echo "\": {" >> files-info/$file.info

  i=1
  grep -o "http://az816091.vo.msecnd.net/courses.*mp3" $file | while read line
  do
    echo "    \"$i\" : \"$line\"," >> files-info/$file.info
    i=$((i + 1))
  done

  sed -i '$ s/.$//' files-info/$file.info;
  sed -i "s///" files-info/$file.info;

  echo "  }," >> files-info/$file.info;
done
