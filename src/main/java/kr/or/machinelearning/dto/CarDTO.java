package kr.or.machinelearning.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CarDTO {
	private int year;
    
    
    @JsonProperty("kms_driven")
    private int kmsDriven;
    
    // Fuel Type
    @JsonProperty("fuel_type_cng")
    private boolean fuelTypeCng;
    
    @JsonProperty("fuel_type_diesel")
    private boolean fuelTypeDiesel;
    
    @JsonProperty("fuel_type_petrol")
    private boolean fuelTypePetrol;
    
    // Seller Type
    @JsonProperty("seller_type_dealer")
    private boolean sellerTypeDealer;
    
    @JsonProperty("seller_type_individual")
    private boolean sellerTypeIndividual;
    
    // Transmission
    @JsonProperty("transmission_automatic")
    private boolean transmissionAutomatic;
    
    @JsonProperty("transmission_manual")
    private boolean transmissionManual;
    
    // Owner (이전과 동일)
    @JsonProperty("owner_0")
    private boolean owner0;
    
    @JsonProperty("owner_1")
    private boolean owner1;
    
    @JsonProperty("owner_3")
    private boolean owner3;

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getKmsDriven() {
		return kmsDriven;
	}

	public void setKmsDriven(int kmsDriven) {
		this.kmsDriven = kmsDriven;
	}

	public boolean isFuelTypeCng() {
		return fuelTypeCng;
	}

	public void setFuelTypeCng(boolean fuelTypeCng) {
		this.fuelTypeCng = fuelTypeCng;
	}

	public boolean isFuelTypeDiesel() {
		return fuelTypeDiesel;
	}

	public void setFuelTypeDiesel(boolean fuelTypeDiesel) {
		this.fuelTypeDiesel = fuelTypeDiesel;
	}

	public boolean isFuelTypePetrol() {
		return fuelTypePetrol;
	}

	public void setFuelTypePetrol(boolean fuelTypePetrol) {
		this.fuelTypePetrol = fuelTypePetrol;
	}

	public boolean isSellerTypeDealer() {
		return sellerTypeDealer;
	}

	public void setSellerTypeDealer(boolean sellerTypeDealer) {
		this.sellerTypeDealer = sellerTypeDealer;
	}

	public boolean isSellerTypeIndividual() {
		return sellerTypeIndividual;
	}

	public void setSellerTypeIndividual(boolean sellerTypeIndividual) {
		this.sellerTypeIndividual = sellerTypeIndividual;
	}

	public boolean isTransmissionAutomatic() {
		return transmissionAutomatic;
	}

	public void setTransmissionAutomatic(boolean transmissionAutomatic) {
		this.transmissionAutomatic = transmissionAutomatic;
	}

	public boolean isTransmissionManual() {
		return transmissionManual;
	}

	public void setTransmissionManual(boolean transmissionManual) {
		this.transmissionManual = transmissionManual;
	}

	public boolean isOwner0() {
		return owner0;
	}

	public void setOwner0(boolean owner0) {
		this.owner0 = owner0;
	}

	public boolean isOwner1() {
		return owner1;
	}

	public void setOwner1(boolean owner1) {
		this.owner1 = owner1;
	}

	public boolean isOwner3() {
		return owner3;
	}

	public void setOwner3(boolean owner3) {
		this.owner3 = owner3;
	}

	@Override
	public String toString() {
		return "CarDTO [year=" + year + ", kmsDriven=" + kmsDriven + ", fuelTypeCng="
				+ fuelTypeCng + ", fuelTypeDiesel=" + fuelTypeDiesel + ", fuelTypePetrol=" + fuelTypePetrol
				+ ", sellerTypeDealer=" + sellerTypeDealer + ", sellerTypeIndividual=" + sellerTypeIndividual
				+ ", transmissionAutomatic=" + transmissionAutomatic + ", transmissionManual=" + transmissionManual
				+ ", owner0=" + owner0 + ", owner1=" + owner1 + ", owner3=" + owner3 + "]";
	}

}
