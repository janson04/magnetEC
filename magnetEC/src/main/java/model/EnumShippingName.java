package model;

//運送方式對應的中文名稱
public enum EnumShippingName {
	delivery("宅配") , cashondelivery("貨到付款") , pick711("7-11純取貨") , pickpay711("7-11取貨付款");

    private String name;
    
    private EnumShippingName(String name){
        this.name=name;
    }
    
	public String getName() {
		return name;
	}
	
	//原本使用valueOf來取得，但如果為空值，或是沒有此Enum會跳出Exception(常見是大小寫錯誤)
    public static EnumShippingName getEnum(String value) {
    	//空值處理
        if (value == null || value.length() < 1) {
            return null;
        }
        
        //大小寫處理
        for (EnumShippingName t : values()) {
            if (t.name().equalsIgnoreCase(value)) {
                return t;
            }
        }
        
        return null;
    }
}
