// SPDX-License-Identifier: MIT
pragma solidity >0.5.11;
pragma experimental ABIEncoderV2;

contract CryptoDrive{
    // Structure for storing the filehash,filename as File 
    
    struct File{
        string filehash;
        string filename;
    }
    
    // Mapping for Storing user id as string and File Structure array as value
    // Mapping is private
    
    mapping(string=>File[]) private FileHashes;
    mapping(string=>string) private PassHash;
    mapping(string=>string) private PublicKeys;
    
    // Function AddFileHash which takes user id , filehash , filename
    // It is pushes the structure in Filehash Mapping
    
    function AddFileHash(string memory user_id,string memory filehash,string memory filename) public {
        FileHashes[user_id].push(File(filehash,filename));
    }
    
    // Function GetFilehash which takes the user id 
    // It will return the struct array
    
    function GetFilehash(string memory user_id) public view returns (File[] memory){
        return FileHashes[user_id];
    }
    
    // Funtion to Save the user id , pass hash, public keys in the different mappings while SignUp
    
    function SignUp(string memory user_id,string memory pass_hash,string memory public_keys) public{
        PassHash[user_id]=pass_hash;
        PublicKeys[user_id]=public_keys;
    }
    
    // Function to GetPassHash which takes user id as input and returns PassHash which is saved earlier
    
    function GetPassHash(string memory user_id) public view returns (string memory){
        return PassHash[user_id];
    }
    
    // Function to get public keys for a particular input user id
    
    function getPublicKey(string memory user_id) public view returns (string memory){
        return PublicKeys[user_id];
    }
    
    
    
}
