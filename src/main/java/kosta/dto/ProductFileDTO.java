package kosta.dto;

public class ProductFileDTO {
	private int productFileCode;
	private int productCode;
	private String productFile;
	
	public ProductFileDTO() { }
	public ProductFileDTO(int productFileCode, int productCode, String productFile) {
		super();
		this.productFileCode = productFileCode;
		this.productCode = productCode;
		this.productFile = productFile;
	}
	public int getProductFileCode() {
		return productFileCode;
	}
	public void setProductFileCode(int productFileCode) {
		this.productFileCode = productFileCode;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public String getProductFile() {
		return productFile;
	}
	public void setProductFile(String productFile) {
		this.productFile = productFile;
	}
	
	
	
	
}
