package kr.nigagara.teamalpha.goods;

public class GoodsVO {

	private Integer goodsNum;

	private String goodsName;

	private String weight;

	private Integer quantity;

	private Integer estimatedPrice;

	private String receiverName;

	private String receiverZipcode;

	private String receiverAddr;

	private String receiverTel;

	private String senderZipcode;

	private String senderAddr;

	private String deliveryTool;

	private String goodsMsg;

	private String matchState;

	private String senderId;

	public GoodsVO() {
		// TODO Auto-generated constructor stub
	}

	public GoodsVO(Integer goodsNum, String goodsName, String weight, Integer quantity, Integer estimatedPrice,
			String receiverName, String receiverZipcode, String receiverAddr, String receiverTel, String senderZipcode,
			String senderAddr, String deliveryTool, String goodsMsg, String matchState, String senderId) {
		super();
		this.goodsNum = goodsNum;
		this.goodsName = goodsName;
		this.weight = weight;
		this.quantity = quantity;
		this.estimatedPrice = estimatedPrice;
		this.receiverName = receiverName;
		this.receiverZipcode = receiverZipcode;
		this.receiverAddr = receiverAddr;
		this.receiverTel = receiverTel;
		this.senderZipcode = senderZipcode;
		this.senderAddr = senderAddr;
		this.deliveryTool = deliveryTool;
		this.goodsMsg = goodsMsg;
		this.matchState = matchState;
		this.senderId = senderId;
	}

	public Integer getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(Integer goodsNum) {
		this.goodsNum = goodsNum;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getEstimatedPrice() {
		return estimatedPrice;
	}

	public void setEstimatedPrice(Integer estimatedPrice) {
		this.estimatedPrice = estimatedPrice;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverZipcode() {
		return receiverZipcode;
	}

	public void setReceiverZipcode(String receiverZipcode) {
		this.receiverZipcode = receiverZipcode;
	}

	public String getReceiverAddr() {
		return receiverAddr;
	}

	public void setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
	}

	public String getReceiverTel() {
		return receiverTel;
	}

	public void setReceiverTel(String receiverTel) {
		this.receiverTel = receiverTel;
	}

	public String getSenderZipcode() {
		return senderZipcode;
	}

	public void setSenderZipcode(String senderZipcode) {
		this.senderZipcode = senderZipcode;
	}

	public String getSenderAddr() {
		return senderAddr;
	}

	public void setSenderAddr(String senderAddr) {
		this.senderAddr = senderAddr;
	}

	public String getDeliveryTool() {
		return deliveryTool;
	}

	public void setDeliveryTool(String deliveryTool) {
		this.deliveryTool = deliveryTool;
	}

	public String getGoodsMsg() {
		return goodsMsg;
	}

	public void setGoodsMsg(String goodsMsg) {
		this.goodsMsg = goodsMsg;
	}

	public String getMatchState() {
		return matchState;
	}

	public void setMatchState(String matchState) {
		this.matchState = matchState;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	@Override
	public String toString() {
		return "GoodsVO [goodsNum=" + goodsNum + ", goodsName=" + goodsName + ", weight=" + weight + ", quantity="
				+ quantity + ", estimatedPrice=" + estimatedPrice + ", receiverName=" + receiverName
				+ ", receiverZipcode=" + receiverZipcode + ", receiverAddr=" + receiverAddr + ", receiverTel="
				+ receiverTel + ", senderZipcode=" + senderZipcode + ", senderAddr=" + senderAddr + ", deliveryTool="
				+ deliveryTool + ", goodsMsg=" + goodsMsg + ", matchState=" + matchState + ", senderId=" + senderId
				+ "]";
	}
	
	
}
