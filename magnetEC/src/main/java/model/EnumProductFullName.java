package model;

//磁鐵材質縮寫對應的中文名稱
public enum EnumProductFullName {
	ND("燒結釹鐵硼"),FE("鐵氧體磁鐵"),RM("軟性橡膠磁鐵"),
    SM("釤鈷磁鐵"),AL("鋁鎳鈷磁鐵"),PM("塑膠磁鐵"),
    MQ("黏結釹鐵硼");

    private String FullName;

    private EnumProductFullName(String FullName){
        this.FullName=FullName;
    }

	public String getFullName() {
		return FullName;
	}
	
	//原本使用valueOf來取得，但如果為空值，或是沒有此Enum會跳出Exception(常見是大小寫錯誤)
    public static EnumProductFullName getEnum(String value) {
    	//空值處理
        if (value == null || value.length() < 1) {
            return null;
        }
        
        //大小寫處理
        for (EnumProductFullName t : values()) {
            if (t.name().equalsIgnoreCase(value)) {
                return t;
            }
        }
        
        return null;
    }
}
