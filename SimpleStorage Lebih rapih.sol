 // SPDX-License-Identifier:  Darius Joshua. Hak Cipta 
//- pragma solidity 0.8.19: buat versi compiler.
// - uint256: tipe data angka bulat non-negatif (0 sampai 2^256-1).
//- string: tipe data teks.
//- struct: bikin tipe data custom (kumpulan variabel jadi satu paket).
//- mapping: struktur data key-value, mirip objek JS.
//- public: fungsi/variabel bisa diakses bebas dari luar.
//- view: fungsi cuma baca, nggak nulis ke blockchain.
//- memory: storage sementara saat fungsi dieksekusi (buat parameter string dll).
// - calldata: mirip memory tapi khusus buat parameter fungsi external.
// SimpleStorage: kontrak sederhana buat nyimpen & ngambil angka favorit, plus nge-list orang
pragma solidity 0.8.19; // kita pakai versi 0.8.19 nyesuain versi remix

contract SimpleStorage {
    uint256 myFavoriteNumber; // variabel buat nyimpen angka favorit

    // tipe data buat nyimpen info orang: nama & angka favoritnya
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople; // array orang tidak terbatas alias dinamis, jika didalam ada Person[2] artinya ada batasa/statis jumlah  orang yang harus ditambhkan
    mapping(string => uint256) public nameToFavoriteNumber; // biar bisa kita cek angka favorit tiap orang  setiap nama 

    // fungsi buat nyimpen angka favorit baru
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber; // langsung simpen
    }

    // fungsi buat ngambil angka favorit yang udah disimpen
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber; // balikin nilai misalnya yang terkirim 5 maka akan balik 5 
    }

    // fungsi buat nambah orang ke dalem list nama sama angka favorit 
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // tambahin orang baru ke array
        listOfPeople.push(Person(_favoriteNumber, _name));
        // simpen juga di mapping supaya gampang cari nanti
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

//seharunya berhasil tetapi kekurangan ETH di gas fee alias punya saya 0 
