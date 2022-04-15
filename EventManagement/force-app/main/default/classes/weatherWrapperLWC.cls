public class weatherWrapperLWC {
	@AuraEnabled
    public String city;
    @AuraEnabled
    public String country;
    @AuraEnabled
    public Integer timezone;
    @AuraEnabled
    public Integer population;
    @AuraEnabled
	public Double latitute;
    @AuraEnabled
    public Double longitude;
    @AuraEnabled
    public Double temperature;
    @AuraEnabled
    public Double feels_like;
    @AuraEnabled
    public Double temp_min;
    @AuraEnabled
    public Double pressure;
    @AuraEnabled
    public Double sea_level;
    @AuraEnabled
    public DateTime currentDateTime;
	public weatherWrapperLWC(){}
}
