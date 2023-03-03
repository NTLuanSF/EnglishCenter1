public virtual class Payment {

    public string paymentName {get; set;}

    public Date paymentDate {get; set;}

    public String paymentMethod {get ; set;}

    public string createdBy {get ; set;} 

    public string classId {get ; set;}

    public string accountId {get ; set;}

    public Double amount {get ; set;}

    public string status {get ; set;}

    public Payment(){
        this.accountId = 'Abcd12345';
    }
    
    public virtual string Pay() {
        return 'Thanh toán...' ;
    }

}