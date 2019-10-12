package com.xzit.sso.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="employee")
public class Employee implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer empId;//'员工id',
	@Column
	private String empUsername;//员工登录账号',
	@Column
	private String empPassword;//'员工登录密码',
	@Column
	private String empName;//'员工姓名',
	@Column
	private Integer empSex;// '员工性别 0女 1男',
	@Column
	private Integer empAge;// '员工年龄',
	@Column
	private String empEdu; // '员工学历',
	@Column
	private Integer empStatus; //'员工状态  0正常 1离职',
	@Column
	private String empSchool;// '员工毕业学校',
	@Column
	private String empCountry;// '员工国籍',
	@Column
	private String empProvince;// '员工省份',
	@Column
	private String empCity;// '员工市区',
	@Column
	private String empAddress;// '员工详细地址',
	@Column
	private String empPhone; //'员工联系方式',
	@Column
	private String empNational;// '员工民族',
	@Column
	private String empIdcard;// '员工身份证号',
	@Column
	private String empWork;//'员工工作经验',
	@Column
	private Date empEntryTime;// '员工入职时间',
	@Column
	private Integer empPositionId;//'员工职位  外键 - 职位表id',
	@Column
	private Integer empDepartmentId;//'员工入职部门  外键 - 部门表id',
	@Column
	private String empNote;// '面试结果',
	@Column
	private Integer empProbation;//'试用期(月份)',
	@Column
	private String empSubsidy;// '员工补贴(什么类型的补贴)',
	@Column
	private String empDescs;// '附件 图片地址,文件地址,中间用逗号隔开',
	public Integer getEmpId() {
		return empId;
	}
	public void setEmpId(Integer empId) {
		this.empId = empId;
	}
	public String getEmpUsername() {
		return empUsername;
	}
	public void setEmpUsername(String empUsername) {
		this.empUsername = empUsername;
	}
	public String getEmpPassword() {
		return empPassword;
	}
	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public Integer getEmpSex() {
		return empSex;
	}
	public void setEmpSex(Integer empSex) {
		this.empSex = empSex;
	}
	public Integer getEmpAge() {
		return empAge;
	}
	public void setEmpAge(Integer empAge) {
		this.empAge = empAge;
	}
	public String getEmpEdu() {
		return empEdu;
	}
	public void setEmpEdu(String empEdu) {
		this.empEdu = empEdu;
	}
	public Integer getEmpStatus() {
		return empStatus;
	}
	public void setEmpStatus(Integer empStatus) {
		this.empStatus = empStatus;
	}
	public String getEmpSchool() {
		return empSchool;
	}
	public void setEmpSchool(String empSchool) {
		this.empSchool = empSchool;
	}
	public String getEmpCountry() {
		return empCountry;
	}
	public void setEmpCountry(String empCountry) {
		this.empCountry = empCountry;
	}
	public String getEmpProvince() {
		return empProvince;
	}
	public void setEmpProvince(String empProvince) {
		this.empProvince = empProvince;
	}
	public String getEmpCity() {
		return empCity;
	}
	public void setEmpCity(String empCity) {
		this.empCity = empCity;
	}
	public String getEmpAddress() {
		return empAddress;
	}
	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}
	public String getEmpPhone() {
		return empPhone;
	}
	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}
	public String getEmpNational() {
		return empNational;
	}
	public void setEmpNational(String empNational) {
		this.empNational = empNational;
	}
	public String getEmpIdcard() {
		return empIdcard;
	}
	public void setEmpIdcard(String empIdcard) {
		this.empIdcard = empIdcard;
	}
	public String getEmpWork() {
		return empWork;
	}
	public void setEmpWork(String empWork) {
		this.empWork = empWork;
	}
	public Date getEmpEntryTime() {
		return empEntryTime;
	}
	public void setEmpEntryTime(Date empEntryTime) {
		this.empEntryTime = empEntryTime;
	}
	public Integer getEmpPositionId() {
		return empPositionId;
	}
	public void setEmpPositionId(Integer empPositionId) {
		this.empPositionId = empPositionId;
	}
	public Integer getEmpDepartmentId() {
		return empDepartmentId;
	}
	public void setEmpDepartmentId(Integer empDepartmentId) {
		this.empDepartmentId = empDepartmentId;
	}
	public String getEmpNote() {
		return empNote;
	}
	public void setEmpNote(String empNote) {
		this.empNote = empNote;
	}
	public Integer getEmpProbation() {
		return empProbation;
	}
	public void setEmpProbation(Integer empProbation) {
		this.empProbation = empProbation;
	}
	public String getEmpSubsidy() {
		return empSubsidy;
	}
	public void setEmpSubsidy(String empSubsidy) {
		this.empSubsidy = empSubsidy;
	}
	public String getEmpDescs() {
		return empDescs;
	}
	public void setEmpDescs(String empDescs) {
		this.empDescs = empDescs;
	}
	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", empUsername=" + empUsername + ", empPassword=" + empPassword
				+ ", empName=" + empName + ", empSex=" + empSex + ", empAge=" + empAge + ", empEdu=" + empEdu
				+ ", empStatus=" + empStatus + ", empSchool=" + empSchool + ", empCountry=" + empCountry
				+ ", empProvince=" + empProvince + ", empCity=" + empCity + ", empAddress=" + empAddress + ", empPhone="
				+ empPhone + ", empNational=" + empNational + ", empIdcard=" + empIdcard + ", empWork=" + empWork
				+ ", empEntryTime=" + empEntryTime + ", empPositionId=" + empPositionId + ", empDepartmentId="
				+ empDepartmentId + ", empNote=" + empNote + ", empProbation=" + empProbation + ", empSubsidy="
				+ empSubsidy + ", empDescs=" + empDescs + "]";
	}
	
	
	
	
	
	
}
