pragma solidity  0.8.6;
contract LoanFactory {
    uint loanId = 0;
    mapping (address => uint) public employmentLoanOwners;
    struct EmploymentLoan{
        int _borrowAmount;
         int8 _interestRate;
         int8  _paybackMonths;
         int    _collateralAmount;
         address  _employer;
         address  _borrower;
    }
    EmploymentLoan[]public idToLoan;

    function createNewLoan(
        int _borrowAmount,
        int8 _interestRate,
        int8 _paybackMonths,
        int _collateralAmount,
        address _employer,
        address _borrower,
        uint8 _priceFeedDecimals

    ) external returns (uint) {
        
        EmploymentLoan memory newLoan =EmploymentLoan({
            _borrowAmount:_borrowAmount,
            _interestRate:_interestRate,
            _paybackMonths:_paybackMonths,
            _collateralAmount:_collateralAmount,
            _employer:_employer,
            _borrower:_borrower
            //_priceFeedDecimals:_priceFeedDecimals
        }
           
        );

        loanId++;
        idToLoan[loanId] = newLoan;
        employmentLoanOwners[msg.sender] = loanId;
        return loanId;
    }

    function getLoanAddressByID(uint _id) public view returns (EmploymentLoan memory) {
        return idToLoan[_id];
    }

    function getLoanByOwner(address _owner) public view returns (uint) {
        return employmentLoanOwners[_owner];
    }

}
