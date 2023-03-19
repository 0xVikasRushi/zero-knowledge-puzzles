const chai = require('chai');
const { compile, loadBigInt } = require('circom');
const { wasm } = require('circom_tester');
const path = require("path");
const F1Field = require("ffjavascript").F1Field;
const Scalar = require("ffjavascript").Scalar;
exports.p = Scalar.fromString("21888242871839275222246405745257275088548364400416034343698204186575808495617");
const Fr = new F1Field(exports.p);

const wasm_tester = require("circom_tester").wasm;

const assert = chai.assert;

describe("Add Test ", function (){
    this.timeout(100000);

    it("Should create a Addition circuit", async()=>{
        const circuit = await wasm_tester(path.join(__dirname,"../Addition","Add.circom"));
        console.log("Circuit",circuit);
        await circuit.loadConstraints();
        let witness ; 
        // 2+ 4 = 6
        const expectedOutput = 6;
        
        witness = await circuit.calculateWitness({"a":[2,4]},true);
        console.log("witness",witness[1]);
        assert(Fr.eq(Fr.e(witness[0]), Fr.e(1)));
        assert(Fr.eq(Fr.e(witness[1]), Fr.e(expectedOutput)));
    
    })
})