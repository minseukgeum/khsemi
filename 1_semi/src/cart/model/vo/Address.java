package cart.model.vo;

public class Address {
	
	private String address_name;
	private String memberid;
	private String receiver;
	private String re_phone;
	private String postal;
	private String address1;
	private String address2;
	
	
	
	public Address() {
		// TODO Auto-generated constructor stub
	}



	public Address(String address_name, String memberid, String receiver, String re_phone, String postal,
			String address1, String address2) {
		super();
		this.address_name = address_name;
		this.memberid = memberid;
		this.receiver = receiver;
		this.re_phone = re_phone;
		this.postal = postal;
		this.address1 = address1;
		this.address2 = address2;
	}



	public String getAddress_name() {
		return address_name;
	}



	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}



	public String getMemberid() {
		return memberid;
	}



	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}



	public String getReceiver() {
		return receiver;
	}



	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}



	public String getRe_phone() {
		return re_phone;
	}



	public void setRe_phone(String re_phone) {
		this.re_phone = re_phone;
	}



	public String getPostal() {
		return postal;
	}



	public void setPostal(String postal) {
		this.postal = postal;
	}



	public String getAddress1() {
		return address1;
	}



	public void setAddress1(String address1) {
		this.address1 = address1;
	}



	public String getAddress2() {
		return address2;
	}



	public void setAddress2(String address2) {
		this.address2 = address2;
	}



	@Override
	public String toString() {
		return "Address [address_name=" + address_name + ", memberid=" + memberid + ", receiver=" + receiver
				+ ", re_phone=" + re_phone + ", postal=" + postal + ", address1=" + address1 + ", address2=" + address2
				+ "]";
	}
	
	

}
