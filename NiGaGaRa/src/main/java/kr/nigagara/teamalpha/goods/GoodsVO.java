package kr.nigagara.teamalpha.goods;

public class GoodsVO {

	private int goods_Num;
	private String goods_Name;
	private String weight;
	private int quantity;
	private int estimated_Price;
	private String receiver_Name;
	private String receiver_zipcode;
	private String receiver_Addr;
	private String receiver_Tel;
	private String sender_zipcode;
	private String sender_Addr;
	private String delivery_Tool;
	private String goods_Msg;
	private String match_State;
	private String sender_id;
	private String receiver_Addr_detail;
	private String sender_Addr_detail;
	private String delivery_state;

	public GoodsVO() {
		// TODO Auto-generated constructor stub
	}

	public GoodsVO(int goods_Num, String goods_Name, String weight, int quantity, int estimated_Price,
			String receiver_Name, String receiver_zipcode, String receiver_Addr, String receiver_Tel,
			String sender_zipcode, String sender_Addr, String delivery_Tool, String goods_Msg, String match_State,
			String sender_id, String receiver_Addr_detail, String sender_Addr_detail, String delivery_state) {
		super();
		this.goods_Num = goods_Num;
		this.goods_Name = goods_Name;
		this.weight = weight;
		this.quantity = quantity;
		this.estimated_Price = estimated_Price;
		this.receiver_Name = receiver_Name;
		this.receiver_zipcode = receiver_zipcode;
		this.receiver_Addr = receiver_Addr;
		this.receiver_Tel = receiver_Tel;
		this.sender_zipcode = sender_zipcode;
		this.sender_Addr = sender_Addr;
		this.delivery_Tool = delivery_Tool;
		this.goods_Msg = goods_Msg;
		this.match_State = match_State;
		this.sender_id = sender_id;
		this.receiver_Addr_detail = receiver_Addr_detail;
		this.sender_Addr_detail = sender_Addr_detail;
		this.delivery_state = delivery_state;
	}

	public int getGoods_Num() {
		return goods_Num;
	}

	public void setGoods_Num(int goods_Num) {
		this.goods_Num = goods_Num;
	}

	public String getGoods_Name() {
		return goods_Name;
	}

	public void setGoods_Name(String goods_Name) {
		this.goods_Name = goods_Name;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getEstimated_Price() {
		return estimated_Price;
	}

	public void setEstimated_Price(int estimated_Price) {
		this.estimated_Price = estimated_Price;
	}

	public String getReceiver_Name() {
		return receiver_Name;
	}

	public void setReceiver_Name(String receiver_Name) {
		this.receiver_Name = receiver_Name;
	}

	public String getReceiver_zipcode() {
		return receiver_zipcode;
	}

	public void setReceiver_zipcode(String receiver_zipcode) {
		this.receiver_zipcode = receiver_zipcode;
	}

	public String getReceiver_Addr() {
		return receiver_Addr;
	}

	public void setReceiver_Addr(String receiver_Addr) {
		this.receiver_Addr = receiver_Addr;
	}

	public String getReceiver_Tel() {
		return receiver_Tel;
	}

	public void setReceiver_Tel(String receiver_Tel) {
		this.receiver_Tel = receiver_Tel;
	}

	public String getSender_zipcode() {
		return sender_zipcode;
	}

	public void setSender_zipcode(String sender_zipcode) {
		this.sender_zipcode = sender_zipcode;
	}

	public String getSender_Addr() {
		return sender_Addr;
	}

	public void setSender_Addr(String sender_Addr) {
		this.sender_Addr = sender_Addr;
	}

	public String getDelivery_Tool() {
		return delivery_Tool;
	}

	public void setDelivery_Tool(String delivery_Tool) {
		this.delivery_Tool = delivery_Tool;
	}

	public String getGoods_Msg() {
		return goods_Msg;
	}

	public void setGoods_Msg(String goods_Msg) {
		this.goods_Msg = goods_Msg;
	}

	public String getMatch_State() {
		return match_State;
	}

	public void setMatch_State(String match_State) {
		this.match_State = match_State;
	}

	public String getSender_id() {
		return sender_id;
	}

	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}

	public String getReceiver_Addr_detail() {
		return receiver_Addr_detail;
	}

	public void setReceiver_Addr_detail(String receiver_Addr_detail) {
		this.receiver_Addr_detail = receiver_Addr_detail;
	}

	public String getSender_Addr_detail() {
		return sender_Addr_detail;
	}

	public void setSender_Addr_detail(String sender_Addr_detail) {
		this.sender_Addr_detail = sender_Addr_detail;
	}

	public String getDelivery_state() {
		return delivery_state;
	}

	public void setDelivery_state(String delivery_state) {
		this.delivery_state = delivery_state;
	}

	@Override
	public String toString() {
		return "GoodsVO [goods_Num=" + goods_Num + ", goods_Name=" + goods_Name + ", weight=" + weight + ", quantity="
				+ quantity + ", estimated_Price=" + estimated_Price + ", receiver_Name=" + receiver_Name
				+ ", receiver_zipcode=" + receiver_zipcode + ", receiver_Addr=" + receiver_Addr + ", receiver_Tel="
				+ receiver_Tel + ", sender_zipcode=" + sender_zipcode + ", sender_Addr=" + sender_Addr
				+ ", delivery_Tool=" + delivery_Tool + ", goods_Msg=" + goods_Msg + ", match_State=" + match_State
				+ ", sender_id=" + sender_id + ", receiver_Addr_detail=" + receiver_Addr_detail
				+ ", sender_Addr_detail=" + sender_Addr_detail + ", delivery_state=" + delivery_state + "]";
	}

	
}
