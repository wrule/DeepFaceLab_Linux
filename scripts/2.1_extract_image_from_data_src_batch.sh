#!/bin/bash

# 视频分祯
extractVideo() {
  file=$1
  index=$2
  cp $file ../data_src.mp4
  rm -rf ../data_src
  pushd ../../scripts > /dev/null
    yes "" | ./2_extract_image_from_data_src.sh
  popd > /dev/null
  rm -rf ./$index
  mv ../data_src ./$index
  pushd ./$index > /dev/null
    for png in `ls *.png`
      do
        mv $png "$index-$png"
      done
  popd > /dev/null
  mv ./$index/*.png ./data_src
  rm -rf $index
}

# 主函数
main() {
  pushd ../workspace/data_srcs > /dev/null
    rm -rf data_src
    mkdir data_src
    i=1
    for file in `ls *.mp4`
      do
        echo $file $index
        extractVideo $file $i
        let i=$i+1
      done
    mv ./data_src ../data_src
  popd > /dev/null
}

main
