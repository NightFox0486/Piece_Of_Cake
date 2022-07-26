package com.E203.pjt;

import com.E203.pjt.model.entity.WishList;
import com.E203.pjt.model.entity.WishListPK;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.internal.bytebuddy.matcher.ElementMatchers.is;

@SpringBootTest
class CommonPjtApplicationTests {

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("commontest");
	EntityManager em = emf.createEntityManager();



	@Test
	@Transactional
	public void testEmbeddable() {
		WishListPK wishListID = new WishListPK();
		wishListID.setUserSeq(1);
		wishListID.setPartySeq(1);

		WishList wishList = new WishList();
		wishList.setWishListID(wishListID);

		em.persist(wishList);
		em.flush();
		em.clear();

		wishList = em.find(WishList.class, wishListID);

	}


}
