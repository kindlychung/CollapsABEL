
# Installation

## In terminal:

    ### Download and install plink2

    #### For mac
    cd /tmp
    wget https://bitbucket.org/kindlychung/collr2/downloads/plink-mac
    mv plink-mac plink
    sudo cp plink /usr/local/bin

    #### For Linux
    cd /tmp
    wget https://bitbucket.org/kindlychung/collr2/downloads/plink-linux
    mv plink-mac plink
    sudo cp plink /usr/local/bin

## In R:

    require(devtools)
    install_bitbucket("kindlychung/txtutils")
    install_bitbucket("kindlychung/manqq2")
    install_bitbucket("kindlychung/collr2")

# Changes


* p values are not allowed to be 0
* sskn bug fixed
* steamlined workflow

# To do

* email plots
