package model;

//付款方式縮寫對應的中文名稱
public enum EnumPayName {
	remittance("匯款") , creditcard("線上刷卡") , payondelivery("貨到付款");

    private String name;

    private EnumPayName(String name){
        this.name=name;
    }

	public String getName() {
		return name;
	}
	
	//原本使用valueOf來取得，但如果為空值，或是沒有此Enum會跳出Exception(常見是大小寫錯誤)
    public static EnumPayName getEnum(String value) {
    	//空值處理
        if (value == null || value.length() < 1) {
            return null;
        }
        
        //大小寫處理
        for (EnumPayName t : values()) {
            if (t.name().equalsIgnoreCase(value)) {
                return t;
            }
        }
        
        return null;
    }
}
