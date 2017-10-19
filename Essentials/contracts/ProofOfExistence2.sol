pragma solidity ^0.4.15;

contract ProofOfExistence2 {
    bytes32[] public proofs;
    address public owner;

    function ProofOfExistence2() {
        owner = msg.sender;
    }

    // calculate and store the proof for a document
    function notarize(string _document) {
        bytes32 proof = proofFor(_document);
        storeProof(proof); 
    }

    // store a proof in a collection
    function storeProof(bytes32 _proof) {
        proofs.push(_proof);
    }

    // helper function to get a document's sha256
    // read-only function
    function proofFor(string _document) constant returns (bytes32) {
        return sha256(_document);
    }

    // check if a document has been notarized
    function checkDocument(string _document) constant returns (bool) {
        bytes32 proof = proofFor(_document);
        hasProof(proof);
    }

    // check if a document has been notarized
    function hasProof(bytes32 proof) constant returns (bool) {
        for (uint i = 0; i < proofs.length; i++) {
            if (proofs[i] == proof) {
                return true;
            }
        }
        return false;
    }
}
