package com.ocsy.checkin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orderdetail {
	private int ord_num;
	private int or_num;
	private int pnum;
	private int cost;
	private int qty;
}
