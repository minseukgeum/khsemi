package buy.model.vo;

import java.sql.Date;

public class Buy {
	private String order_no;
	private String member_id;
	private String p_id;
	private String order_name;
	private String order_address;
	private String order_phone;
	private String order_require;
	private String total_price;
	private Date order_date;
	
	public Buy() {}

	public Buy(String order_no, String member_id, String p_id, String order_name, String order_address,
			String order_phone, String order_require, String total_price, Date order_date) {
		super();
		this.order_no = order_no;
		this.member_id = member_id;
		this.p_id = p_id;
		this.order_name = order_name;
		this.order_address = order_address;
		this.order_phone = order_phone;
		this.order_require = order_require;
		this.total_price = total_price;
		this.order_date = order_date;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_address() {
		return order_address;
	}

	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}

	public String getOrder_phone() {
		return order_phone;
	}

	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}

	public String getOrder_require() {
		return order_require;
	}

	public void setOrder_require(String order_require) {
		this.order_require = order_require;
	}

	public String getTotal_price() {
		return total_price;
	}

	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	@Override
	public String toString() {
		return "Buy [order_no=" + order_no + ", member_id=" + member_id + ", p_id=" + p_id + ", order_name="
				+ order_name + ", order_address=" + order_address + ", order_phone=" + order_phone + ", order_require="
				+ order_require + ", total_price=" + total_price + ", order_date=" + order_date + "]";
	}
}
