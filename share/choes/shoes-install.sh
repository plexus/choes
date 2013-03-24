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
