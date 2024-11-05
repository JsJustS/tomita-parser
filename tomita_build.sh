#!/bin/bash

mkdir -p /tomita/build
cd /tomita/build
cmake ../src/ -DMAKE_ONLY=FactExtract/Parser/tomita-parser -DCMAKE_BUILD_TYPE=Release
make -j2
mv /tomita/build/FactExtract/Parser/tomita-parser/tomita-parser /tomita/parser
cp /tomita/build/FactExtract/Parser/textminerlib_java/libFactExtract-Parser-textminerlib_java.so /usr/lib
#rm -rf /tomita/.git /tomita/src /tomita/build

curl -sL -O 'https://github.com/yandex/tomita-parser/releases/download/v1.0/libmystem_c_binding.so.linux_x64.zip'
unzip libmystem_c_binding.so.linux_x64.zip
mv -f libmystem_c_binding.so /tomita/libmystem_c_binding.so
cp /tomita/build/libmystem_c_binding.so /usr/lib
chmod +x /tomita/libmystem_c_binding.so
rm -f libmystem_c_binding.so.linux_x64.zip
ln -s /tomita/parser /usr/bin/tomita-parser
