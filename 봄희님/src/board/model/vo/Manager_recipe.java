//레펙 레시피 1.
package board.model.vo;

public class Manager_recipe {
	private int m_R_No;
	private String memberid;
	private String p_Id;
	private String m_R_Title;
	private String m_R_Exp;
	private int m_R_Cap;
	private int m_R_Price;
	private String m_R_Origin;
	
	public Manager_recipe() {
		
	}

	public Manager_recipe(int m_R_No, String memberid, String p_Id, String m_R_Title, String m_R_Exp, int m_R_Cap,
			int m_R_Price, String m_R_Origin) {
		super();
		this.m_R_No = m_R_No;
		this.memberid = memberid;
		this.p_Id = p_Id;
		this.m_R_Title = m_R_Title;
		this.m_R_Exp = m_R_Exp;
		this.m_R_Cap = m_R_Cap;
		this.m_R_Price = m_R_Price;
		this.m_R_Origin = m_R_Origin;
	}

	public int getM_R_No() {
		return m_R_No;
	}

	public void setM_R_No(int m_R_No) {
		this.m_R_No = m_R_No;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getP_Id() {
		return p_Id;
	}

	public void setP_Id(String p_Id) {
		this.p_Id = p_Id;
	}

	public String getM_R_Title() {
		return m_R_Title;
	}

	public void setM_R_Title(String m_R_Title) {
		this.m_R_Title = m_R_Title;
	}

	public String getM_R_Exp() {
		return m_R_Exp;
	}

	public void setM_R_Exp(String m_R_Exp) {
		this.m_R_Exp = m_R_Exp;
	}

	public int getM_R_Cap() {
		return m_R_Cap;
	}

	public void setM_R_Cap(int m_R_Cap) {
		this.m_R_Cap = m_R_Cap;
	}

	public int getM_R_Price() {
		return m_R_Price;
	}

	public void setM_R_Price(int m_R_Price) {
		this.m_R_Price = m_R_Price;
	}

	public String getM_R_Origin() {
		return m_R_Origin;
	}

	public void setM_R_Origin(String m_R_Origin) {
		this.m_R_Origin = m_R_Origin;
	}

	@Override
	public String toString() {
		return "Manager_recipe [m_R_No=" + m_R_No + ", memberid=" + memberid + ", p_Id=" + p_Id + ", m_R_Title="
				+ m_R_Title + ", m_R_Exp=" + m_R_Exp + ", m_R_Cap=" + m_R_Cap + ", m_R_Price=" + m_R_Price
				+ ", m_R_Origin=" + m_R_Origin + "]";
	}
	
	

}
