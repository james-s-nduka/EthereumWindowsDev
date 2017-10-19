pragma solidity ^0.4.15;

contract ProofOfExistence3 {
    mapping (bytes32 => bool) private proofs;
    address public owner;

    function ProofOfExistence3() {
        owner = msg.sender;
    }

    // calculate and store the proof for a document
    function notarize(string _document) {
        bytes32 proof = proofFor(_document);
        storeProof(proof); 
    }

    // store a proof in a mapping
    function storeProof(bytes32 _proof) {
        proofs[_proof] = true;
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

    // retrns true is documnt has been notarized
    function hasProof(bytes32 _proof) constant returns (bool) {
        return proofs[_proof];
    }
}
