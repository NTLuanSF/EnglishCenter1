public class BankTransfer extends payment {
    public override string Pay() {
        string mesage = accountId + ' Đã thanh toán qua chuyển khoản';
        system.debug(mesage);
        return mesage;
    }
}