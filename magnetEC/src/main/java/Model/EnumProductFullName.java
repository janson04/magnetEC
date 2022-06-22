package Model;

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
}
