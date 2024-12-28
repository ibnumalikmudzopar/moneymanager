models/ 
    untuk struktur data
views/ 
    UI atau tampilan aplikasi
viewmodels/ 
    Untuk Mengelola Logika Dan State
services/
    service untuk interaksi dengan data eksternal
providers/
    Riverpod providers untuk state management

alur penulisan kode
model/ - services/ - viewmodels/ - providers/ - views/


model membuat struktur data, lalu di ambil datanya oleh services, lalu data yang didapat akan dikelola di
viewmodel dan disiapkan*untuk dipakai oleh view, providers sebagai penghubungnya

view akan mengamati perubahan pada viewmodel, dan mengikuti viewmodel secara otomatis

lengkapnya seperti ini 
                Alur lengkapnya dapat dijelaskan sebagai berikut:

                Model: Menyediakan struktur data yang diperlukan, seperti Transaction, Category, atau 
                Account dalam aplikasi money management. Model ini bisa berupa kelas sederhana yang 
                memetakan data dari API atau database.

                Service: Bertanggung jawab untuk mengambil atau menyimpan data dari sumber eksternal 
                seperti SQLite, Firebase, atau API. Service ini bertindak sebagai lapisan yang 
                menghubungkan aplikasi dengan database atau backend, dan menyediakan data yang akan 
                digunakan oleh ViewModel.

                ViewModel: Berfungsi sebagai pengelola logika aplikasi. ViewModel akan mengambil data dari 
                Service, melakukan pemrosesan (jika diperlukan), dan kemudian mengubah state aplikasi yang
                akan dipakai oleh View. ViewModel menjaga supaya UI selalu sinkron dengan data terbaru yang
                ada di aplikasi.

                View: Tampilan (UI) yang akan ditampilkan ke pengguna. View hanya bertugas untuk menampilkan
                data dan menangani interaksi pengguna, sementara logika diserahkan sepenuhnya kepada 
                ViewModel. Dengan menggunakan state management seperti Riverpod, View akan mengamati state
                di ViewModel dan secara otomatis memperbarui UI ketika data berubah.

*(seperti filtering dan transformasi**)
**(seperti date jadi string)

PEMBAGIAN FE DAN BE
MVVM SRP
model           BE
service         BE
repositories(untuk offline storage)    BE 
view                FE
viewmodel           FE
provider            FE

STRUKTUR FOLDER ALL 

lib/
│
├── main.dart                         # Entry point aplikasi
│
├── core/
│   ├── constants/                    # Untuk menyimpan konstanta global (misalnya, warna, font, dll.)
│   │   └── app_colors.dart
│   │
│   └── utils/                        # Helper functions, formatters, dll.
│       └── date_formatter.dart
│
├── models/                           # Model class (berisi struktur data dan mapping ke db)
│   ├── user.dart
│   ├── transaction.dart
│   ├── category.dart
│   └── subcategory.dart
│
├── services/                         # Service untuk CRUD dan database
│   ├── database_services.dart        # Koneksi database
│   ├── user_service.dart
│   ├── transaction_service.dart
│   ├── category_service.dart
│   └── subcategory_service.dart
│
├── viewmodels/                       # ViewModel untuk mengelola state dengan Riverpod
│   ├── user_viewmodel.dart
│   ├── transaction_viewmodel.dart
│   ├── category_viewmodel.dart
│   └── subcategory_viewmodel.dart
│
├── views/                            # Views atau halaman yang ditampilkan ke user
│   ├── home/
│   │   └── home_screen.dart          # Halaman Home
│   ├── transactions/
│   │   └── transaction_screen.dart   # Halaman Transaksi
│   ├── profile/
│   │   └── profile_screen.dart       # Halaman Profil
│   └── shared/                       # Reusable widget (misalnya tombol, form)
│       ├── custom_button.dart
│       └── custom_form.dart
│
├── providers/                        # Tempat untuk menampung semua provider yang digunakan di seluruh aplikasi
│   ├── user_provider.dart
│   ├── transaction_provider.dart
│   ├── category_provider.dart
│   └── subcategory_provider.dart
│
└── widgets/                          # Widget yang dapat digunakan di berbagai tempat
    ├── bottom_navigation_bar.dart    # BottomNavigationBar widget
    └── custom_card.dart              # Contoh reusable widget


