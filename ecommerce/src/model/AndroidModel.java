package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "android")
public class AndroidModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "android_id")
	private int androidId;
	
	@Column(name ="android_about_description")
	private String androidAboutDescription;
	
	@Column(name ="android_email")
	private String androidemail;

	@Column(name ="android_phone")
	private String androidPhone;

	@Column(name ="android_version")
	private String androidVersion;

	@Column(name ="android_copyright")
	private String androidCopyRight;

	public int getAndroidId() {
		return androidId;
	}

	public void setAndroidId(int androidId) {
		this.androidId = androidId;
	}

	public String getAndroidAboutDescription() {
		return androidAboutDescription;
	}

	public void setAndroidAboutDescription(String androidAboutDescription) {
		this.androidAboutDescription = androidAboutDescription;
	}

	public String getAndroidemail() {
		return androidemail;
	}

	public void setAndroidemail(String androidemail) {
		this.androidemail = androidemail;
	}

	public String getAndroidPhone() {
		return androidPhone;
	}

	public void setAndroidPhone(String androidPhone) {
		this.androidPhone = androidPhone;
	}

	public String getAndroidVersion() {
		return androidVersion;
	}

	public void setAndroidVersion(String androidVersion) {
		this.androidVersion = androidVersion;
	}

	public String getAndroidCopyRight() {
		return androidCopyRight;
	}

	public void setAndroidCopyRight(String androidCopyRight) {
		this.androidCopyRight = androidCopyRight;
	}
	
	

}
