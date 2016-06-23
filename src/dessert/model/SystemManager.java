package dessert.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="systemManager")
public class SystemManager  implements Serializable{
	@Id
	private int SystemManagerId;
	private String SystemManagerName;
	private String SystemManagerPassword;
	public SystemManager(){
		
	}
	public SystemManager (int SystemManagerId,String password){
		this.SystemManagerId=SystemManagerId;
		this.SystemManagerPassword=password;
	}
	
	public int getSystemManagerId() {
		return SystemManagerId;
	}
	public void setSystemManagerId(int systemManagerId) {
		SystemManagerId = systemManagerId;
	}
	public String getSystemManagerName() {
		return SystemManagerName;
	}
	public void setSystemManagerName(String systemManagerName) {
		SystemManagerName = systemManagerName;
	}
	public String getSystemManagerPassword() {
		return SystemManagerPassword;
	}
	public void setSystemManagerPassword(String systemManagerPassword) {
		SystemManagerPassword = systemManagerPassword;
	}
	
}
