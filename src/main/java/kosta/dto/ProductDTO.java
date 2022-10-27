package kosta.dto;

public class ProductDTO {
	private int productCode;
	private int productCategory;
	private String productName;
	private int productPrice;
	private int productQty;
	private String productExplain;
	private String  fname; 
	
	private String orderDate;
	private int orderTotalPrice;
	
	private int productCategoryCode;
	private String productMgr;

	private String pFileName;	

	
	public ProductDTO() { }

	

	public ProductDTO(int productCode, int productCategory, String productName, int productPrice, int productQty,
			String productExplain,String pFileName) {
		super();
		this.productCode = productCode;
		this.productCategory = productCategory;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productQty = productQty;
		this.productExplain = productExplain;
		this.pFileName = pFileName;
	}
	
	
	//수정하기- 이름, 가격, 수량, 설명 
	public ProductDTO( int productCode,String productName, int productPrice, int productQty, String productExplain) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productQty = productQty;
		this.productExplain = productExplain;
	}
	
	//월별 매출
	public ProductDTO(int productCode, String productName, String orderDate,int orderTotalPrice) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.orderDate = orderDate;
		this.orderTotalPrice = orderTotalPrice;
	}
	//상위카테고리
	public ProductDTO(int productCode, String productName,int productPrice,String productExplain ) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productExplain = productExplain;
	}
	
	//파일불러오기 
	
	public ProductDTO(int productCode, int productCategory, String productName, int productPrice, int productQty,
			String productExplain, String fname, String orderDate, int orderTotalPrice, String pFileName) {
		super();
		this.productCode = productCode;
		this.productCategory = productCategory;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productQty = productQty;
		this.productExplain = productExplain;
		this.fname = fname;
		this.orderDate = orderDate;
		this.orderTotalPrice = orderTotalPrice;
		this.pFileName = pFileName;
	}
	//selectByarrange
	
	public ProductDTO(int productCode, String productName, int productPrice, String productExplain, String pFileName) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productExplain = productExplain;
		this.pFileName = pFileName;
	}




	public int getProductCode() {
		return productCode;
	}




	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public int getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(int productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductName() {//productDTO.getproductname productDTO.getproductCode
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductQty() {
		return productQty;
	}

	public void setProductQty(int productQty) {
		this.productQty = productQty;
	}

	public String getProductExplain() {
		return productExplain;
	}

	public void setProductExplain(String productExplain) {
		this.productExplain = productExplain;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getProductCategoryCode() {
		return productCategoryCode;
	}

	public void setProductCategoryCode(int productCategoryCode) {
		this.productCategoryCode = productCategoryCode;
	}
	public String getpFileName() {
		return pFileName;
	}

	public void setpFileName(String pFileName) {
		this.pFileName = pFileName;
	}
	
	
}
