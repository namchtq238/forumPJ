package com.forum.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Topic extends Entry {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;
	@OneToMany
	@JoinColumn(name = "message_id")
	private Set<Message> messages;
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

}
