// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "contracts/HelpeeContract.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {

    // A reference to the HelpeeContract instance
    HelpeeContract _contract;

    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeAll() public {
        _contract = new HelpeeContract();
    }

    function checkRegisterUser() public {
        // Use 'Assert' methods: https://remix-ide.readthedocs.io/en/latest/assert_library.html


        address payable _walletAddress = payable(address(this));
        bytes32 _name = "0x00";

        uint result = _contract.registerUser(_walletAddress, _name);
        Assert.ok( result > 0, "Register user should return an ID > 0");
    }
}
    