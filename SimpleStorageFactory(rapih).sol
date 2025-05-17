 // SPDX-License-Identifier: Handmade tapi ambil dari Learn Solidity Smart Contract Development 
// Ini kontrak buat bikin dan ngatur banyak SimpleStorage Gampangnya, ini "pabrik" yang bikin kotak penyimpanan angka dari file simple storage tadi

pragma solidity ^0.8.19; // ikuttin versi compiler yang kita pake di remix

// Import SimpleStorage biar bisa dipakai di sini
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    // array buat nyimpen semua kontrak SimpleStorage yang udah kita bikin
    SimpleStorage[] public listOfSimpleStorageContracts;

    // fungsi buat bikin kontrak SimpleStorage baru
    // tinggal manggil aja, nanti masuk ke listOfSimpleStorageContracts
    function createSimpleStorageContract() public {
        // new SimpleStorage() bikin kontraknya
        SimpleStorage ss = new SimpleStorage();
        // push tambahin ke array
        listOfSimpleStorageContracts.push(ss);
    }

    // fungsi buat masukin angka ke kontrak tertentu
    // _simpleStorageIndex: nomor urut di array (0,1,2...)
    // _simpleStorageNumber: angka yang mau disimpen
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // ambil kontraknya, terus panggil store()
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    // fungsi buat ambil angka dari kontrak tertentu
    // tinggal kasih indexnya, balikinnya angka yang terakhir disimpen
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}

// Penjelasan istilah singkat
// pragma: atur versi compiler Solidity
// uint256: angka bulat gede, gak boleh minus
// import: ambil kode dari file lain
// contract: tempat kita nulis logika yang dijalanin di blockchain
// array[]: daftar data, bisa diakses pake index
// new: bikin instansi baru di blockchain
// push(): tambahin data ke array
// public: bisa dipanggil siapa aja
// view: cuma baca, gak nulis/mengubah data
// returns: jenis data yang dikembaliin fungsi
// index: posisi di array, mulai dari 0
