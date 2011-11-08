#! /bin/sh

# Remove build directory if exist
if cd build; then
    echo
    echo "********** Removing older build directory **********"
    cd ..
    sudo rm -rf build
fi

echo
echo "**************************************************"
echo "********** build floating-point library **********"
echo "**************************************************"
echo

sudo python setup.py install --use-coreaudio --use-jack
sudo rm -rf build

echo
echo "**************************************************"
echo "************** build double library **************"
echo "**************************************************"
echo

sudo python setup.py install --use-coreaudio --use-double --use-jack
