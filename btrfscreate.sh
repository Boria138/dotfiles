#!/bin/bash
#
# Btrfscreate v2.0
# ----------------------------------------|
#           :
# Author    : LinuxShef,Barry
#           :
# Project   : https://github.com/shefpower/btrfscreate.git,https://github.com/Boria138/btrfscreate.git
#           :
# License   : LGPL-3.0 (http://opensource.org/licenses/lgpl-3.0.html)
#           :
#----------------------------------------------------------------------|
clear
echo '



  ____ _______ _____  ______ _____    _____ _____  ______       _______ ______
 |  _ \__   __|  __ \|  ____/ ____|  / ____|  __ \|  ____|   /\|__   __|  ____|
 | |_) | | |  | |__) | |__ | (___   | |    | |__) | |__     /  \  | |  | |__
 |  _ <  | |  |  _  /|  __| \___ \  | |    |  _  /|  __|   / /\ \ | |  |  __|
 | |_) | | |  | | \ \| |    ____) | | |____| | \ \| |____ / ____ \| |  | |____
 |____/  |_|  |_|  \_\_|   |_____/   \_____|_|  \_\______/_/    \_\_|  |______|




'
sleep 2
#----------------------------------------------------------------------|
clear
echo '



          _    _ _______ _    _  ____  _____   _____
     /\  | |  | |__   __| |  | |/ __ \|  __ \ / ____|
    /  \ | |  | |  | |  | |__| | |  | | |__) | (___
   / /\ \| |  | |  | |  |  __  | |  | |  _  / \___ \
  / ____ \ |__| |  | |  | |  | | |__| | | \ \ ____) |
 /_/    \_\____/   |_|  |_|  |_|\____/|_|  \_\_____/



  _      _____ _   _ _    ___   __ _____ _    _ ______ ______            ____          _____  _______     __
 | |    |_   _| \ | | |  | \ \ / // ____| |  | |  ____|  ____|   ___    |  _ \   /\   |  __ \|  __ \ \   / /
 | |      | | |  \| | |  | |\ V /| (___ | |__| | |__  | |__     ( _ )   | |_) | /  \  | |__) | |__) \ \_/ /
 | |      | | | . ` | |  | | > <  \___ \|  __  |  __| |  __|    / _ \/\ |  _ < / /\ \ |  _  /|  _  / \   /
 | |____ _| |_| |\  | |__| |/ . \ ____) | |  | | |____| |      | (_>  < | |_) / ____ \| | \ \| | \ \  | |
 |______|_____|_| \_|\____//_/ \_\_____/|_|  |_|______|_|       \___/\/ |____/_/    \_\_|  \_\_|  \_\ |_|





'
sleep 2
#----------------------------------------------------------------------|
#                                                      #
#               Change of localization                 #
#                                                      #
#----------------------------------------------------------------------|
clear
echo '


                <<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                ----------------------------------------------------------
                   _      ____          _____ _____ _   _  _____
                  | |    / __ \   /\   |  __ \_   _| \ | |/ ____|
                  | |   | |  | | /  \  | |  | || | |  \| | |  __
                  | |   | |  | |/ /\ \ | |  | || | | . ` | | |_ |
                  | |___| |__| / ____ \| |__| || |_| |\  | |__| |  _ _ _
                  |______\____/_/    \_\_____/_____|_| \_|\_____| (_|_|_)


                <<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
'
setfont cyr-sun16
clear
#----------------------------------------------------------------------|
#                                                      #
#                     Choice Disk                      #
#                                                      #
#----------------------------------------------------------------------|
echo '


                <<<<<<<<<<<<<<<<<<<<< Выбор разделов >>>>>>>>>>>>>>>>>>>>>
                ----------------------------------------------------------

                     Введите разделы диска в отведенные для них поля

                   (Root- Корневой)  (Boot- Загрузочный) (Swap- Подкачка)

                        Например ( sda2, sdb2, sdc2 , nvme0n1p2 )


                <<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                       -> Чтобы пропустить это шаг нажмите Enter <-
'
read -p "
                                 -> Boot: " boot
read -p "
                                 -> Root: " root
read -p "
                                 -> Swap: " swap
echo $boot
echo $root
echo $swap
#----------------------------------------------------------------------|
#                                                      #
#                 Make filesystem partition            #
#                                                      #
#----------------------------------------------------------------------|
clear
echo '


                <<<<<<<<<<< Выбор файловой системы Boot раздела >>>>>>>>>>
                ----------------------------------------------------------

                    Выберите файловую систему загрузочного  boot раздела

                 Согласно вашей версии Bios (обычный стрый BIOS или UEFI)

                 Для UEFI формат FAT32 . Для обычнго BIOS Ext4 или Ext2

                <<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>v
                      -> Чтобы пропустить это шаг нажмите Enter <-
'
echo -e "\t

                       -> Для UEFI введите ( fat32 )"
echo -e "\t

                       -> Для обычного Bios форматировать в Ext4 введите ( ext4 )"
echo -e "\t

                       -> Для обычного Bios фоматировать в Ext2 введиет ( ext2 )"
echo -n "

                           -> Введите значение : "
read main_menu
      case "$main_menu" in
         "fat32" ) clear ; mkfs.vfat -F32 /dev/$boot
         ;;
         "ext4" ) clear ; mkfs.ext4 /dev/$boot
         ;;
         "ext2" ) clear ; mkfs.ext2 /dev/$boot
      esac
#----------------------------------------------------------------------|
clear
mkfs.btrfs -f /dev/$root
mkswap /dev/$swap
swapon /dev/$swap
#----------------------------------------------------------------------|
#                                                      #
#                    Mounts partition                  #
#                                                      #
#----------------------------------------------------------------------|
clear
echo '



                <<<<<<<<<<<<<<<<<<<<<< Монтирование >>>>>>>>>>>>>>>>>>>>>>
                ----------------------------------------------------------

                      Выберите один из вариантов монтирования :

                      1 - Монтирование с параметрами для HDD дисков

                      2- Монтирование с параметрами для SSD дисков

                <<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
'
echo -e "\t
                    -> Продолжить в Btrfs для HDD введите ( 1 )"

echo -e "\t

                    -> Продолжить в Btrfs для SSD введите ( 2 )"
echo -n "

                      -> Введите значение : "
read main_menu
      case "$main_menu" in
         "2" ) clear ;
mount  /dev/$root /mnt

btrfs su cr /mnt/@

btrfs su cr /mnt/@home

umount /mnt

mount -o rw,relatime,compress=zstd:2,ssd_spread,max_inline=256,commit=120,subvol=@ /dev/$root /mnt

mkdir /mnt/{boot,home}

mount -o rw,relatime,compress=zstd:2,ssd_spread,max_inline=256,commit=120,subvol=@home  /dev/$root  /mnt/home
         ;;
         "1") clear ;
mount  /dev/$root /mnt

btrfs su cr /mnt/@

btrfs su cr /mnt/@home


umount /mnt

mount -o rw,relatime,compress=zstd:2,max_inline=256,commit=120,autodefrag,subvol=@ /dev/$root /mnt

mkdir /mnt/{boot,home}

mount -o rw,relatime,compress=zstd:2,max_inline=256,commit=120,autodefrag,subvol=@home  /dev/$root  /mnt/home
      esac
#----------------------------------------------------------------------|
clear
echo '



                <<<<<<<<<<<<<< Монтирование boot раздела >>>>>>>>>>>>>>>>>
                ----------------------------------------------------------

                          Монтирование загрузочного раздела !

                   Выберите один из варинтов монтирования boot раздела

                       Для обычного биоса (НЕ UEFI) введите Bios

                             Для UEFI биоса , введите Uefi

                <<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
'
echo -e "\t
                        -> Для UEFI или EFI введите ( 1 ) "
echo -e "\t
                        -> Для обычного Bios введите ( 2 )"
echo -n "
                        -> Введите значение : "
read main_menu
      case "$main_menu" in
         "1" ) mkdir /mnt/boot/efi ; mount /dev/$boot /mnt/boot/efi
         ;;
         "2" ) mount /dev/$boot  /mnt/boot/
      esac
#----------------------------------------------------------------------|
#                                                      #
#                      Info partition                  #
#                                                      #
#----------------------------------------------------------------------|
clear
lsblk
clear

echo '









                                     Выбор ядра системы
              .──────────────────────────────────────────────────────────────.
              .                                                              .
              .                                                              .
              .  Выберите один из варинтов ядра ,для установки системы :     .
              .                                                              .
              .   -> С обычным ядром Linux - введите 1                       .
              .                                                              .
              .   -> C производительным ядром Linux-zen - введите 2          .
              .                                                              .
              .   -> С ядром повышеной стабильности Linux-lts - введите 3    .
              .                                                              .
              .                                                              .
              .──────────────────────────────────────────────────────────────.
'
echo -e "\t
                                 -> Linux ( 1 ) "
echo -e "\t
                                 -> Linux-zen ( 2 )"
echo -e "\t
                                 -> Linux-lts ( 3 )"
echo -n "
                                 -> Введите значение : "
read main_menu
      case "$main_menu" in

         "1" ) clear ; pacstrap -i /mnt base base-devel linux linux-headers linux-firmware dosfstools btrfs-progs iucode-tool archlinux-keyring bluez bluez-utils micro git --noconfirm
         ;;
         "2" ) clear ; pacstrap -i /mnt base base-devel linux-zen linux-zen-headers linux-firmware dosfstools btrfs-progs iucode-tool archlinux-keyring bluez bluez-utils micro git --noconfirm
         ;;
         "3" ) clear ; pacstrap -i /mnt base base-devel linux-lts linux-lts-headers linux-firmware dosfstools btrfs-progs iucode-tool archlinux-keyring bluez bluez-utils micro git --noconfirm
      esac

clear
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash -c "git clone https://github.com/boria138/dotfiles"

