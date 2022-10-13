package com.app.model;

import javax.persistence.*;

@MappedSuperclass //to tell hibernate(JPA imple.) that no table corresponds to this entity class
public class BaseEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
