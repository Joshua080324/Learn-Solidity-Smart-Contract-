 // SPDX-License-Identifier:  Darius Joshua. Hak Cipta 

pragma solidity 0.8.19;

// Import kontrak SimpleStorage (harus ada di folder yang sama)
import {SimpleStorage} from "./SimpleStorage.sol";

// Kontrak anak yang akan menambahkan +5 setiap kali kita memanggil store(...)
contract AddFiveStorage is SimpleStorage {
    // Override fungsi store di SimpleStorage sehingga
    // myFavoriteNumber selalu jadi (_favoriteNumber + 5)
    function store(uint256 _favoriteNumber) public override {
        myFavoriteNumber = _favoriteNumber + 5;
    }
}
