// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Import koneksi ke Chainlink untuk ambil harga ETH ke USD dari luar blockchain
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol"; 

// Kita pakai library karena ini cuma kumpulan fungsi bantu,
// bukan kontrak utama atau interface yang harus diimplementasikan
library PriceConverter {

    // Fungsi ini ngambil harga ETH ke USD dari Chainlink
    // Misalnya 1 ETH = 2.000 USD, maka kita ambil angka itu dan ubah ke format 18 digit
    function getPrice() internal view returns (uint256) {
        // Alamat kontrak Chainlink Data Feed di jaringan Sepolia
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );

        // Ambil data harga terbaru dari Chainlink
        (, int256 answer, , , ) = priceFeed.latestRoundData();

        // Ubah format dari 8 digit (standar Chainlink) ke 18 digit (standar Ethereum)
        return uint256(answer * 1e10); // 1e10 = 10^10
    }

    // Fungsi ini menghitung berapa USD dari jumlah ETH yang dikirim pengguna
    // Contoh: 0.5 ETH → 0.5 * 2000 USD = 1000 USD
    function getConversionRate(
        uint256 ethAmount // Ini jumlah ETH yang ingin dikonversi ke USD
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice(); // Ambil harga ETH sekarang (dalam USD)
        
        // Kalkulasi nilai ETH ke USD: harga * jumlah / 1e18 (karena semua angka 18 digit)
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd; // Hasil akhir: total USD yang sesuai
    }
}
