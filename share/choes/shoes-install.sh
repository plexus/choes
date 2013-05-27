#!/bin/sh

if [[ "$SHOES_DIR" == "" ]]; then
    if [[ `whoami` == "root" ]]; then
        export SHOES_DIR='/opt/shoes';
    else
        export SHOES_DIR=${HOME}/.shoes
    fi
fi

echo $SHOES_DIR

function install_green_shoes() {
    cd $SHOES_DIR
    git clone https://github.com/ashbb/green_shoes.git
    sudo apt-get install ruby-gtk2 ruby-pango ruby-cairo
    cd green_shoes/bin
    ln -s gshoes shoes
    chmod +x gshoes
}

function install_brown_shoes() {
    cd $SHOES_DIR
    git clone https://github.com/shoes/brown_shoes.git
    cd brown_shoes
    ln -s ../swing-shoooes bin/swing-shoooes
    ln -s ../swt-shoooes bin/swt-shoooes
    ln -s swt-shoooes bin/shoes
}

function install_shoes4() {
    cd $SHOES_DIR
    git clone https://github.com/shoes/shoes4.git
}

function install_red_shoes() {
    cd $SHOES_DIR
    git clone https://github.com/shoes/shoes.git red_shoes
}
