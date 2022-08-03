package model;

//發票方式對應的中文名稱
public enum EnumReceiptName {
	DonationInvoices("捐贈發票") , DuplicateInvoices("二聯式發票") , TriplicateInvoices("三聯式發票");

    private String name;

    private EnumReceiptName(String name){
        this.name=name;
    }

	public String getName() {
		return name;
	}
	
	//原本使用valueOf來取得，但如果為空值，或是沒有此Enum會跳出Exception(常見是大小寫錯誤)
    public static EnumReceiptName getEnum(String value) {
    	//空值處理
        if (value == null || value.length() < 1) {
            return null;
        }
        
        //大小寫處理
        for (EnumReceiptName t : values()) {
            if (t.name().equalsIgnoreCase(value)) {
                return t;
            }
        }
        
        return null;
    }
}
