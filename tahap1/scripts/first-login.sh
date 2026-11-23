#!/bin/bash
FLAG="$HOME/.first_login_done"
if [ ! -f "$FLAG" ]; then
    xfce4-terminal --hold -e "bash -c 'echo Selamat datang di Olympus!; uname -a; echo Konfigurasi awal berhasil dijalankan.'"
    touch "$FLAG"
fi
