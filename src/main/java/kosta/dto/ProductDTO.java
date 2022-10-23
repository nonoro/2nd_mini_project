package kosta.dto;

public class Product {
	private int productCode;
	private int productCategory;
	private String productName;
	private int productPrice;
	private int productQty;
	private String productExplain;
	
	public Product() { }

	public Product(int productCode, int productCategory, String productName, int productPrice, int productQty,
			String productExplain) {
		super();
		this.productCode = productCode;
		this.productCategory = productCategory;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productQty = productQty;
		this.productExplain = productExplain;
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

	public String getProductName() {
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
	
	
}
