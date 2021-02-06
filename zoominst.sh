#!/bin/bash



##############################################
# ZOOM INSTALLER      # Program Under GNU GPL#
# By Floppa/CheemsX   # V3 LICENSE           #
# Copyright Floppa/CX # Just Installer For Zo#
# V1.0-GUI            # M in linux/gnu       #
##############################################
trap ''2
dir=`pwd`
domges=`uname -m`
usermode=`whoami`
gede_hulu(){
    whiptail --title " Last Warning " --yesno "Your processor is not supported, an error maybe occured, Are you sure to continue ?" --yes-button "Yes,I don't care" --no-button "Ok, I give up" 20 78
    nackal=$?
    case "${nackal}" in
        0) clear;exit
            ;;
        1) select_lang ;;
    esac
}
warn_not_supportedarch(){
    whiptail --title " Warning! " --yesno "Your Current Processor $domges is not supported" --yes-button "I Don't Care" --no-button "Exit" 20 78
    pfft=$?
    case "${pfft}" in
        0) gede_hulu;;
        1) clear;exit ;;
    esac
}
arch_Check(){
    case $domges in
        arm*) warn_not_spportedarch ;;
        x86 | x86_64) select_lang;;
    esac
}
## END OF ARCHITECTURE CHECK(s)##
## START OF LANGUAGE MENU ##
select_lang(){
    whiptail --title " Choose Language  " --menu "Please Choose one language ,correctly " 25 78 16 \
        "ID" "Indonesian"\
        "" ""\
        "EN" "English" 2>.temp/lang.$$
    lang_sel=`cat .temp/lang.$$`
    case "${lang_sel}" in
        ID) whiptail --title " Pemberitahuan " --yesno " Bahasa Indonesia, Belum tersedia,,Pakai B Inggris Utk sementara? " --yes-button "Ya,Setuju" --no-button "Tidak Mengerti,Keluar" 20 78
            lx=$?
            case "${lx}" in
                0) en_menu;;
                1) clear;exit;;
            esac
            ;;
        EN) en_menu;;
    esac

}
## END LANGUAGE MENU ##
## START EN/ID MAIN MENU ##
en_menu(){
    whiptail --title " Choose Package file to install " --menu " Select package file based with os which one you used." 25 78 16 \
        "deb" "Ubuntu Mint Debian-Based Linux"\
        "" ""\
        "rpm" "Oracle Linux,CentOS,RedHat,OpenSUSE,Fedora"\
        "" ""\
        "tarball" "ArchLinux" 2>.temp/package.$$
    choice=`cat .temp/package.$$`
    case "${choice}" in
        deb ) select_arch
            deb=true;;
        rpm) select_arch
            rpm=true;;
        tarball) select_arch
            tar=true;;
    esac
}
## END OF ID/EN MENU ##
## SPECIAL FUNC
nstep(){
    if [ $deb==true ];then dwn_deb;
    elif [ $rpm==true ];then dwn_rpm;
    elif [ $tarball==true ];then dwn_tarb;
    fi
}
## END OF SPECIAL FUNC
## DOWNLOAD FUNC ##
dwn_rpm()
{
    clear
    echo "+________________________________________+"
    echo "| DOWNLOAD IS NOT USING GUI GAUGE         |"
    echo "+----------------------------------------+"
    (a=0
    while [ $a -lt 100 ];do
        a=$(( $a + 1 ))
        sleep 0.1
        echo -n "Preparing to download required package....$a%\r"
        if [ $a -eq 100 ];then sudo $nz install libgl1-mesa-glx libegl1-mesa libxcb-xtest0 ibus;fi
    done)
    (
    b=0
    while [ $b -lt 100 ];do
        b=$(( $b + 1 ))
        sleep 0.1
        echo -n "Preparing to download zoom files....$b\r"
        if [ $b -eq 100 ];then wget https://zoom.us/client/latest/zoom_$rflop.rpm;fi
    done)
    (
    c=0
    while [ $c -lt 100 ];do
        c=$(($c + 1))
        sleep 0.1
        echo -n "Preparing to install zoom_$rflop.deb....$c%\r"
        if [ $c -eq 100 ];then sudo rpm -i zoom*.rpm;fi
    done)
    whiptail --title " Info " --yesno " Installation Suceed With No error(s)" --yes-button "Exit" --no-button "Back To menu" 9 80
    abc=$?
    case "${abc}" in
        0) clear;exit;;
        1) en_menu ;;
    esac
}
dwn_deb(){
    clear
    echo "+________________________________________+"
    echo "| DOWNLOAD IS NOT USING GUI GAUGE        |"
    echo "+----------------------------------------+"
    (a=0
    while [ $a -lt 100 ];do
        a=$(( $a + 1 ))
        sleep 0.1
        echo -n "Preparing to download required package....$a%\r"
        if [ $a -eq 100 ];then sudo apt-get install libgl1-mesa-glx libegl1-mesa libxcb-xtest0 ibus;fi
    done)
    (
    b=0
    while [ $b -lt 100 ];do
        b=$(( $b + 1 ))
        sleep 0.1
        echo -n "Preparing to download zoom files....$b\r"
        if [ $b -eq 100 ];then wget https://zoom.us/client/latest/zoom_$flop.deb;fi
    done)
    (
    c=0
    while [ $c -lt 100 ];do
        c=$(($c + 1))
        sleep 0.1
        echo -n "Preparing to install zoom_$flop.deb....$c%\r"
        if [ $c -eq 100 ];then sudo dpkg -i zoom*;fi
    done)
    whiptail --title " Info " --yesno " Installation Suceed With No error(s)" --yes-button "Exit" --no-button "Back To menu" 9 80
    abc=$?
    case "${abc}" in
        0) clear;exit;;
        1) en_menu ;;
    esac
}
dwn_tarb()
{
    clear
    echo "+________________________________________+"
    echo "| DOWNLOAD IS NOT USING GUI GAUGE         |"
    echo "+----------------------------------------+"
    (a=0
    while [ $a -lt 100 ];do
        a=$(( $a + 1 ))
        sleep 0.1
        echo -n "Preparing to download required package....$a%\r"
        if [ $a -eq 100 ];then sudo apt-get install libgl1-mesa-glx libegl1-mesa libxcb-xtest0 ibus;fi
    done)
    (
    b=0
    while [ $b -lt 100 ];do
        b=$(( $b + 1 ))
        sleep 0.1
        echo -n "Preparing to download zoom files....$b\r"
        if [ $b -eq 100 ];then wget https://zoom.us/client/latest/zoom_$rflop.pkg.tar.xz;fi
    done)
    (
    c=0
    while [ $c -lt 100 ];do
        c=$(($c + 1))
        sleep 0.1
        echo -n "Preparing to install zoom_$rflop.pkg.tar.xz....$c%\r"
        if [ $c -eq 100 ];then sudo pacman -U zoom*.pkg.tar.xz;fi
    done)
    whiptail --title " Info " --yesno " Installation Suceed With No error(s)" --yes-button "Exit" --no-button "Back To menu" 9 80
    abc=$?
    case "${abc}" in
        0) clear;exit;;
        1) en_menu ;;
    esac
}
## START OF ARCH SELECT MENU ##
select_arch(){
    whiptail --title " Choose One " --menu " Choose One Architecture, Based On your processor,if you didn't know yours, select auto." 25 78 16\
        "64Bit" "amd64/X86_64/X64"\
        "" ""\
        "auto" "Auto detect arch"\
        "" ""\
        "32Bit" "i386/x86" --yes-button "select" --no-button "Exit" 2>.temp/archmenu.$$
    arch=`cat .temp/archmenu.$$`
    case "${arch}" in
        64Bit) flop=amd64
            rflop=x86_64
            nstep;;
        32Bit) flop=i386
            rflop=i686
            nstep;;
        auto) case $domges in
            x86) flop=i386
            rflop=$domges
            nstep;;
            x86_64)flop=amd64
                rflop=$domges
                nstep;;
        esac;;
        *) clear;exit;;
    esac
}
if [ $usermode != 'root' ];then
    whiptail --title " Info " --msgbox " Run This script with 'sudo' or with root usermode" 9 80
else
    if [ -d $dir/.temp ];then
        select_lang
    else
        mkdir .temp
        select_lang
    fi
fi
nz=`if [ -f /bin/yum  ];then
        yum
    elif [ -f /bin/dnf ];then
        dnf
    else
        apt-get
    fi`


