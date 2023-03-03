public class Cash extends Payment {
    public override string  Pay(string accountId) {
        string mesage = accountId + 'Đã thanh toán bằng tiền mặt';
         return mesage;
    }
}