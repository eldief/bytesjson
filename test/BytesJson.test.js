const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");
const { expect } = require("chai");

describe("BytesJson", function () {

  async function fixture() {

    // deploy library
    const BytesJsonLibrary = await ethers.getContractFactory("BytesJson");
    const bytesJsonlibrary = await BytesJsonLibrary.deploy();

    // deploy library user contract
    const BytesJsonUser = await ethers.getContractFactory("BytesJsonUser", {
      libraries: {
        BytesJson: bytesJsonlibrary.address
      }
    });
    const bytesJson = await BytesJsonUser.deploy();

    return { bytesJson };
  }

  describe("init", function () {

    it("Should create empty string", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const init = await bytesJson.init();
  
      expect(init).to.be.equals('');
    });  
  });

  describe("nullType", function () {
    
    it("Should return null", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const nullType = await bytesJson.nullType();
  
      expect(nullType).to.be.equals('null');
    });
  });

  describe("trueType", function () {
    
    it("Should return true", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const trueType = await bytesJson.trueType();
  
      expect(trueType).to.be.equals('true');
    });
  });

  describe("falseType", function () {
    
    it("Should return false", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const falseType = await bytesJson.falseType();
  
      expect(falseType).to.be.equals('false');
    });
  });

  describe("stringType", function () {
    
    it("Should return 'string'", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const stringType = await bytesJson.stringType();
  
      expect(stringType).to.be.equals('"string"');
    });
  });

  describe("uintType", function () {
    
    it("Should return 1", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const uintType = await bytesJson.uintType();
  
      expect(uintType).to.be.equals('1');
    });
  });

  describe("bytes32Type", function () {
    
    it("Should return '0x0000000000000000000000000000000000000000000000000000000000000000'", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const bytes32Type = await bytesJson.bytes32Type();
  
      expect(bytes32Type).to.be.equals('"0x0000000000000000000000000000000000000000000000000000000000000000"');
    });
  });

  describe("addressType", function () {
    
    it("Should return '0x0000000000000000000000000000000000000000'", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const addressType = await bytesJson.addressType();
  
      expect(addressType).to.be.equals('"0x0000000000000000000000000000000000000000"');
    });
  });

  describe("uintArrayType", function () {
    
    it("Should return [0,1]", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const uintArrayType = await bytesJson.uintArrayType();
  
      expect(uintArrayType).to.be.equals('[0,1]');
    });
  });

  describe("stringArrayType", function () {
    
    it("Should return '[0,1]'", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const stringArrayType = await bytesJson.stringArrayType();
  
      expect(stringArrayType).to.be.equals('["0","1"]');
    });
  });

  describe("prop", function () {
    
    it("Should return 'key':'value'", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const prop = await bytesJson.prop();
  
      expect(prop).to.be.equals('"key":"value"');
    });
  });

  describe("array", function () {
    
    it("Should return [0,1]", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const array = await bytesJson.array();
  
      expect(array).to.be.equals('[0,1]');
    });
  });

  describe("object", function () {
    
    it("Should return {'key':'value'}", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const object = await bytesJson.object();
  
      expect(object).to.be.equals('{"key":"value"}');
    });
  });

  describe("objectContatenation", function () {
    
    it("Should return {'key':1},{'key':'value'}", async function () {
      const { bytesJson } = await loadFixture(fixture);
      const objectConcatenation = await bytesJson.objectConcatenation();
  
      expect(objectConcatenation).to.be.equals('{"key":1},{"key":"value"}');
    });
  });
});
