package kosta.dto;

public class ProductCategory {
	private int productCategoryCode;
	private String productCategory;
	private String productMgr;
	
	public ProductCategory() { }

	public ProductCategory(int productCategoryCode, String productCategory, String productMgr) {
		super();
		this.productCategoryCode = productCategoryCode;
		this.productCategory = productCategory;
		this.productMgr = productMgr;
	}

	public int getProductCategoryCode() {
		return productCategoryCode;
	}

	public void setProductCategoryCode(int productCategoryCode) {
		this.productCategoryCode = productCategoryCode;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductMgr() {
		return productMgr;
	}

	public void setProductMgr(String productMgr) {
		this.productMgr = productMgr;
	}
	
	
}
