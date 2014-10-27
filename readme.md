
# Installation

## In terminal:

    ### Some prerequisites

    sudo aptitude install libboost1.55-all-dev git libfuse-dev libc6-dev-i386 wget
    ### Tup building system

    cd /tmp
    git clone git://github.com/gittup/tup.git
    cd tup
    ./bootstrap.sh
    sudo cp tup /usr/local/bin

    ### Build bedcoll

    cd /tmp
    git clone https://github.com/kindlychung/bedcoll
    cd bedcoll
    tup upd
    sudo cp bedcoll /usr/local/bin/

    ### Download and install plink2

    mkdir /tmp/plink2
    cd /tmp/plink2
    wget https://www.cog-genomics.org/static/bin/plink141007/plink_linux_x86_64.zip
    unzip plink_linux_x86_64.zip
    mv plink plink2
    sudo cp -avi plink2 prettify /usr/local/bin

    ### Config Java runtime for R

    sudo R CMD javareconf

## In R:

    install.packages(c("rJython", "rJava"))
    require(devtools)
    Sys.setenv("PKG_CXXFLAGS"="-std=c++11")
    install_bitbucket("kindlychung/txtutils")
    install_bitbucket("kindlychung/manqq")
    install_github("kindlychung/gmailR")
    install_bitbucket("kindlychung/autoGmail")
    install_bitbucket("kindlychung/collr")

# Changes


* p values are not allowed to be 0
* sskn bug fixed
* steamlined workflow

# To do

* email plots
