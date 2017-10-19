pragma solidity ^0.4.15;

contract ProofOfExistence1 {
    bytes32 public proof;
    address public owner;

    function ProofOfExistence1() {
        owner = msg.sender;
    }

    // calculate and store the proof for a document
    function notarize(string _document) {
        proof = proofFor(_document);
    }

    // helper function to get a document's sha256
    // read-only function
    function proofFor(string _document) constant returns (bytes32) {
        return sha256(_document);
    }
}
