public class Cash extends Payment {
    public override string  Pay() {
        string mesage = accountId + ' Đã thanh toán bằng tiền mặt';
        system.debug(mesage);
         return mesage;
    }
}