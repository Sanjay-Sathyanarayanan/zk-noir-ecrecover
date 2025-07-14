use dep::ecrecover;

fn main(
    pub_key_x: [u8; 32],
    pub_key_y:  [u8; 32],
    signature:  [u8; 64], // 64 bytes for r and s (65 -> r, s, v) , v is exculeded as public key is used
    hashed_message: [u8; 32], // Keccak256 hash of the message
    expected_address: Field,
) {
   let address:Field = ecrecover::ecrecover(pub_key_x, pub_key_y, signature, hashed_message);

    assert(address != 0, "Address should not be zero");

    assert(address == expected_address, "Address does not match expected address");
}

// #[test]
// fn test_main() {
//     main(1, 2);

//     // Uncomment to make test fail
//     // main(1, 1);
// }
