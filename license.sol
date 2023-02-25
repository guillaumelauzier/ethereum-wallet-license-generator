pragma solidity ^0.8.0;

contract LicenseGenerator {
    mapping(address => bool) public hasAgreed;

    function generateLicense() public view returns (string memory) {
        require(hasAgreed[msg.sender] == false, "You have already agreed to the license.");

        string memory license = "MIT License"; // Replace with your preferred license
        string memory projectName = "MyProject"; // Replace with your project name
        uint256 currentYear = block.timestamp / 31556952 + 1970; // Get the current year
        string memory licenseText = string(abi.encodePacked(
            "MIT License\n\n",
            "Copyright (c) ", projectName, " ", currentYear, "\n\n",
            "Permission is hereby granted, free of charge, to any person obtaining a copy\n",
            "of this software and associated documentation files (the \"Software\"), to deal\n",
            "in the Software without restriction, including without limitation the rights\n",
            "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell\n",
            "copies of the Software, and to permit persons to whom the Software is\n",
            "furnished to do so, subject to the following conditions:\n\n",
            "The above copyright notice and this permission notice shall be included in\n",
            "all copies or substantial portions of the Software.\n\n",
            "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\n",
            "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\n",
            "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\n",
            "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\n",
            "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\n",
            "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN\n",
            "THE SOFTWARE.\n"
        ));

        hasAgreed[msg.sender] = true;
        return licenseText;
    }
}
