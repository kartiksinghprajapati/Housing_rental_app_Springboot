package com.app.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "transaction_details")
public class TransactionDetails {
	
	@SequenceGenerator(name="seq", initialValue=100000, allocationSize=1)
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq")
	@Column(name = "transation_detail_id", nullable=false)
	private Integer id;
	
	@OneToOne
	@JoinColumn(name="user_id",nullable = false)//FK col name
	private User userId;
	
	@OneToOne
	@JoinColumn(name="property_id",nullable = false)//FK col name
	private Property propertyId;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "payment_done_date")
	private Date paymentDoneDate;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "next_payment_due_date")
	private Date nextPaymentDueDate;
	@Column(length = 1, name = "is_refundable")
	private Character isRefundable;
	@Column(length = 500, name = "payment_mode")
	private String paymentMode;
	@Column(length = 500, name = "amount_paid")
	private String amountPaid;
	
	public TransactionDetails() {}
	
	public TransactionDetails(Integer id, User userId, Property propertyId, Date paymentDoneDate,
			Date nextPaymentDueDate, Character isRefundable, String paymentMode, String amountPaid) {
		super();
		this.id = id;
		this.userId = userId;
		this.propertyId = propertyId;
		this.paymentDoneDate = paymentDoneDate;
		this.nextPaymentDueDate = nextPaymentDueDate;
		this.isRefundable = isRefundable;
		this.paymentMode = paymentMode;
		this.amountPaid = amountPaid;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public Property getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(Property propertyId) {
		this.propertyId = propertyId;
	}

	public Date getPaymentDoneDate() {
		return paymentDoneDate;
	}

	public void setPaymentDoneDate(Date paymentDoneDate) {
		this.paymentDoneDate = paymentDoneDate;
	}

	public Date getNextPaymentDueDate() {
		return nextPaymentDueDate;
	}

	public void setNextPaymentDueDate(Date nextPaymentDueDate) {
		this.nextPaymentDueDate = nextPaymentDueDate;
	}

	public Character getIsRefundable() {
		return isRefundable;
	}

	public void setIsRefundable(Character isRefundable) {
		this.isRefundable = isRefundable;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getAmountPaid() {
		return amountPaid;
	}

	public void setAmountPaid(String amountPaid) {
		this.amountPaid = amountPaid;
	}

	@Override
	public String toString() {
		return "TransactionDetails [id=" + id + ", userId=" + userId + ", propertyId=" + propertyId
				+ ", paymentDoneDate=" + paymentDoneDate + ", nextPaymentDueDate=" + nextPaymentDueDate
				+ ", isRefundable=" + isRefundable + ", paymentMode=" + paymentMode + ", amountPaid=" + amountPaid
				+ "]";
	}
	
	
}
