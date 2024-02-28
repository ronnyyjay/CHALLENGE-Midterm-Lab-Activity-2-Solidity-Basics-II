// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SalaryCalculator {
    address public owner;
    uint256 public age;
    uint256 public hoursWorked;
    uint256 public hourlyRate;
    uint256 public calculateTotSal;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function");
        _;
    }
    
    modifier validRate(uint256 _rate) {
        require(_rate > 0, "Hourly rate must be greater than zero");
        _;
    }
    
    modifier validHoursWorked(uint256 _hours) {
        require(_hours > 0, "Hours worked must be greater than zero");
        _;
    }
    
    function setAge(uint256 _age) public {
        age = _age;
    }
    
    function setHrsWorked(uint256 _hours) public validHoursWorked(_hours) {
        hoursWorked = _hours;
    }
    
    function setRate(uint256 _rate) public onlyOwner validRate(_rate) {
        hourlyRate = _rate;
    }
    
    function calculateTotalSalary() public onlyOwner {
        require(hourlyRate > 0 && hoursWorked > 0, "Hourly rate or hours worked is zero");
        calculateTotSal = hoursWorked * hourlyRate;
    }
}
