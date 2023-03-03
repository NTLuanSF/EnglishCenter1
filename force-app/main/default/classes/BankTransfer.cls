public class BankTransfer extends payment {
    public override string Pay(string accountId) {
        string mesage = accountId + 'Đã thanh toán qua chuyển khoản';
         return mesage;
    }
}