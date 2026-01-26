# Ticketing App (Demo Version)

Repo ini sudah dimodifikasi khusus untuk keperluan **Demo di PC Kampus (Windows + XAMPP)** tanpa perlu install Composer atau Node.js.

> **⚠️ PENTING UNTUK DEMO:**
> Repo ini menyertakan folder `/vendor`, `/node_modules`, dan file `.env` secara sengaja agar bisa langsung _plug-and-play_. Jangan gunakan cara ini untuk _production_ atau _long-term development_.

## 📋 Persiapan (Di PC Kampus)

1. Pastikan **XAMPP** sudah terinstall.
2. Pastikan **PHP** versi 8.2 atau lebih baru (Cek dengan `php -v`).
3. Nyalakan **Apache** & **MySQL** di XAMPP Control Panel.

## 🚀 Cara Menjalankan

### 1. Clone Project

Buka Terminal / CMD / Git Bash di Desktop:

```bash
git clone https://github.com/USERNAME_GITHUB/NAMA_REPO.git
cd NAMA_REPO
```

### 2. Setup Database

1. Buka browser, akses `http://localhost/phpmyadmin`.
2. Buat database baru dengan nama: `ticketing_db`.
3. Klik tab **Import**.
4. Pilih file SQL yang ada di dalam folder project ini (misal: `ticketing_db.sql` atau sejenisnya).
5. Klik **Go** / **Import**.

### 3. Konfigurasi Environment (.env)

File `.env` sudah disertakan. Buka file tersebut dengan Notepad/VS Code, lalu pastikan konfigurasi DB sesuai default XAMPP:

```ini
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=ticketing_db   <-- Pastikan sama dengan nama DB yang dibuat
DB_USERNAME=root           <-- Default XAMPP
DB_PASSWORD=               <-- Default XAMPP kosong (hapus jika ada isinya)
```

### 4. Jalankan Aplikasi

Kembali ke terminal di dalam folder project, jalankan:

```bash
php artisan serve
```

Akses aplikasi di browser:
[http://127.0.0.1:8000](http://127.0.0.1:8000)

---

## 🛠 Troubleshooting

- **Error "Vite manifest not found":** Pastikan folder `public/build` ada. Repo ini harusnya sudah membawanya.
- **Error Database:** Cek kembali settingan `.env` (username/password/nama database).
- **Tampilan Hancur:** Pastikan akses lewat `http://127.0.0.1:8000`, jangan lewat `localhost/folder_project`.
