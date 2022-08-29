# FasaPay Master Flutter

Skeleton untuk mengcoding dengan flutter

DIRECTORY STRUCTURE
-------------------

```
assets                   berisikan image, gif
lib
    config/              contains shared configurations
    control/             berisikan control untuk memproses data
    func/                berisikan fungsi format datetime, number, dll
    helpers/             berisikan code untuk menyimpan data di local hp dan memproses data dari api
    helpers/             berisikan code untuk menghubungkan api dengan app
    shared/              berisikan font dan warna
    translate/           berisikan code untuk merubah bahsa

    ui                   Front end app
        -pages              berisikan code front end halaman
        -widgets            berisikan code yang extends StatelessWidget
tests
    config/              unit test/ wigdet test
```

INSTALATION
------------

# Software Specification

- Flutter 2.2.1 
- • channel stable 
- • https://github.com/flutter/flutter.git
- • Dart 2.13.1


# Perintah

# RUN PROJECT DEV
- flutter run = untuk run project
- * Jika menemukan Error: Cannot run with sound null safety, because the following dependencies don't support null safety:
- flutter run --no-sound-null-safety = untuk run project yang menggunakan package yang belum null safe

# RUN PROJECT DEV
- flutter clean = untuk menghapus folder build
- flutter run --release = untuk run project release

# INSTALL
- flutter pub = untuk mengistall package