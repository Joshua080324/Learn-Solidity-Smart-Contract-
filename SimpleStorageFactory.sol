pragma solidity ^0.8.19;
 // SPDX-License-Identifier: Handmade tapi ambil dari Learn Solidity Smart Contract Development 
import {SimpleStorage} from "./SimpleStorage.sol"; // ambil SimpleStorage biar bisa dipakai

contract StorageFactory {
    // array buat nyimpen alamat SimpleStorage yang udah dibuat
    SimpleStorage[] public storages;

    // kalau mau kotak baru, panggil ini aja
    function createSimpleStorageContract() public {
        // bikin kontrak baru
        SimpleStorage newBox = new SimpleStorage();
        // masukin ke list
        storages.push(newBox);
        // voila, ada kotak baru bisa dipake
    }

    // masukin angka ke kotak tertentu, tinggal sebut idx dan angka
    function sfStore(uint256 idx, uint256 num) public {
        // idx = posisi kotak di array, mulai dari 0
        storages[idx].store(num);
    }

    // ambil angka dari kotak tertentu, panggil idx-nya
    function sfGet(uint256 idx) public view returns (uint256) {
        // view = cuma baca, gak ubah data
        return storages[idx].retrieve();
    }
}