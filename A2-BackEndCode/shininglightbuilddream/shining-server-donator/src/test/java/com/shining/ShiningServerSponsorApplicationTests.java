package com.shining;

import com.shining.controller.DonatorController;
import com.shining.entity.Donator;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ShiningServerSponsorApplicationTests {
	@Autowired
	private DonatorController donatorController;

	@Test
	void donatorControllerTest() {
		donatorController.goods("1");
	}

	@Test
	void donatorControllerTest2() {
		donatorController.login("3");
	}

	@Test
	void donatorControllerTest3() {
		donatorController.queryDonationActivity("1");
	}
	@Test
	void donatorControllerTest4() {
		donatorController.queryDonationActivityByMonth("D1");
	}
	@Test
	void donatorControllerTest5() {
		donatorController.register(Donator.builder().age(1).avatar("/img.png").city("北京市").build());
	}
	@Test
	void donatorControllerTest6() {
		donatorController.updateUser(Donator.builder().id("1").age(1).avatar("/img.png").city("北京市").build());
	}
}
