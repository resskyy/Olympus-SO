# Proyek Sistem Operasi — Tahap 1: Distro Kustom Olympus

- **Nama Distro:** Olympus
- **Topik / Tema:** Topik 1 (Kelompok 1) — Distro Lab Jaringan (`Wireshark`, `nmap`)
- **ISO Induk:** `ubuntu-22.04.5-desktop-amd64.iso`
- **Alat Build:** Cubic
- **Desktop Environment \& Display Manager:** XFCE \& LightDM
- **Anggota Kelompok:**
 - Muhammad Resky (251011090)
 - A. Syamsul Alam (251011042)
 - Muhammad Rhazya (251011082)
 - Ahmad Fauzil Adhim (251011075)
 - Ratu Felisha Aulia (251011057)
 - Wulan Muliana (251011059)
 - Iqlilah Dini Marhayanti (251011084)
 - Ayudyah Pratiwi Aswar (251011098)
 - Abdul Rahim Azhar (251011147)

## Struktur Repositori

- `tahap1/assets/` — Aset gambar (`wallpaper.jpg` dan `logo.jpg`)
- `tahap1/configs/` — Berkas konfigurasi LightDM dan Plymouth
- `tahap1/scripts/` — Skrip `first-login.sh`
- `README.md` — Dokumentasi langkah build dari nol dan alasan pemilihan paket

## Langkah Build Ulang ISO dari Nol

1. Siapkan folder kerja di host (`~/cubic-proyek`), buka **Cubic**, dan pilih ISO induk `ubuntu-22.04.5-desktop-amd64.iso`.
2. Atur identitas *Custom Disk* (`Olympus`) lalu masuk ke terminal *chroot*.
3. Aktifkan repositori `universe` \& `multiverse`, pasang `xfce4`, `xfce4-goodies`, `lightdm`, `lightdm-gtk-greeter`, `xfce4-terminal`, dan `network-manager-gnome`, tetapkan `lightdm` sebagai display manager default, hapus paket bawaan yang tidak diperlukan (`ubuntu-desktop`, `gnome-shell`, `gdm3`, `libreoffice*`, `rhythmbox*`, `thunderbird*`), serta pastikan `ubiquity`, `ubiquity-frontend-gtk`, dan `casper` tersedia.
4. Pasang 10 paket lab jaringan (`wireshark`, `nmap`, `tcpdump`, `iperf3`, `traceroute`, `mtr-tiny`, `net-tools`, `dnsutils`, `curl`, `whois`).
5. Konfigurasikan autologin LightDM (`50-xfce-default.conf` dan `50-live-autologin.conf`), wallpaper kustom (`wallpaper.jpg`), dan tema Plymouth (`distro-splash` dengan `logo.jpg`), lalu jalankan `update-initramfs -u -k all`.
6. Atur identitas distro **Olympus** di `/etc/os-release` dan `/etc/lsb-release` (pertahankan `ID_LIKE=debian` dan `VERSION_CODENAME=jammy`), atur zona waktu, dan pasang skrip `first-login.sh` beserta *autostart*-nya.
7. Jalankan `apt clean && rm -rf /tmp/* /var/lib/apt/lists/*`, keluar dari *chroot*, pilih kernel `/boot` (`5.15.0-204`) pada tab **Kernel**, lalu klik **Generate** untuk membuat file `.iso`.

## Daftar 10 Paket \& Alasan Pemilihan

| No | Paket | Alasan Pemilihan |
| :--- | :--- | :--- |
| 1 | `wireshark` | Analisis paket jaringan berbasis GUI untuk inspeksi protokol. |
| 2 | `nmap` | Pemindaian jaringan, *host discovery*, dan identifikasi port/layanan. |
| 3 | `tcpdump` | Penangkapan dan inspeksi paket jaringan berbasis CLI yang ringan. |
| 4 | `iperf3` | Pengujian *throughput* dan performa jaringan TCP/UDP. |
| 5 | `traceroute` | Penelusuran jalur *hop* paket jaringan menuju tujuan. |
| 6 | `mtr-tiny` | Pemantauan latensi dan *packet loss* per *hop* secara *real-time*. |
| 7 | `net-tools` | Utilitas pengelolaan antarmuka dan tabel jaringan klasik (`ifconfig`, `netstat`, `arp`). |
| 8 | `dnsutils` | Pengujian dan *debugging* resolusi DNS (`dig`, `nslookup`). |
| 9 | `curl` | Pengujian konektivitas dan transfer data HTTP/HTTPS/API dari terminal. |
| 10 | `whois` | Pengecekan informasi registrasi domain, blok IP, dan ASN. |

## Pengujian di VirtualBox

1. Buat VM dengan RAM 2–4 GB, 2 vCPU, disk 25 GB, dan Video Memory 64–128 MB (VMSVGA).
2. *Boot* ISO **Olympus** pada mode *Live System* untuk memeriksa *autologin* XFCE, wallpaper, skrip *first-login*, dan paket lab jaringan.
3. Lakukan instalasi ke *virtual hard disk* menggunakan *Ubiquity*, lepas ISO, lalu *boot* dari disk.
