rmdir /S /Q build
mkdir build
cd build
cmake .. -G "Visual Studio 17 2022" -A x64
cmake --build . --config Release
cd ..
adb push oxrwxr /sdcard/Download
adb shell rm -Rf /sdcard/Download/oxrwxr/logs
pause
