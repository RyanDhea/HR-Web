/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author JOE
 */
@Entity
@Table(name = "JOBS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Job.findAll", query = "SELECT j FROM Job j")
    , @NamedQuery(name = "Job.findByJobId", query = "SELECT j FROM Job j WHERE j.jobId = :jobId")
    , @NamedQuery(name = "Job.findByJobTitle", query = "SELECT j FROM Job j WHERE j.jobTitle = :jobTitle")
    , @NamedQuery(name = "Job.findByMinSalary", query = "SELECT j FROM Job j WHERE j.minSalary = :minSalary")
    , @NamedQuery(name = "Job.findByMaxSalary", query = "SELECT j FROM Job j WHERE j.maxSalary = :maxSalary")})
public class Job implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "JOB_ID")
    private String jobId;
    @Basic(optional = false)
    @Column(name = "JOB_TITLE")
    private String jobTitle;
    @Column(name = "MIN_SALARY")
    private Integer minSalary;
    @Column(name = "MAX_SALARY")
    private Integer maxSalary;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "jobId", fetch = FetchType.LAZY)
    private List<Employee> employeeList;

    public Job() {
    }

    public Job(String jobId, String jobTitle, Integer minSalary, Integer maxSalary) {
        this.jobId = jobId;
        this.jobTitle = jobTitle;
        this.minSalary = minSalary;
        this.maxSalary = maxSalary;
    }

    public Job(String jobId) {
        this.jobId = jobId;
    }

    public Job(String jobId, String jobTitle) {
        this.jobId = jobId;
        this.jobTitle = jobTitle;
    }

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public Integer getMinSalary() {
        return minSalary;
    }

    public void setMinSalary(Integer minSalary) {
        this.minSalary = minSalary;
    }

    public Integer getMaxSalary() {
        return maxSalary;
    }

    public void setMaxSalary(Integer maxSalary) {
        this.maxSalary = maxSalary;
    }

    @XmlTransient
    public List<Employee> getEmployeeList() {
        return employeeList;
    }

    public void setEmployeeList(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (jobId != null ? jobId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Job)) {
            return false;
        }
        Job other = (Job) object;
        if ((this.jobId == null && other.jobId != null) || (this.jobId != null && !this.jobId.equals(other.jobId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Job[ jobId=" + jobId + " ]";
    }
    
}
