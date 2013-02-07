package com.vdehorta.newsletter;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateConfigSingleton {
	private static HibernateConfigSingleton instance = null;
	private SessionFactory sessionFactory = null;
	protected HibernateConfigSingleton() {
		//
	}
	public static HibernateConfigSingleton getInstance() {
	    if(instance == null) {
	        instance = new HibernateConfigSingleton();
	    }
	    return instance;
	}

	@SuppressWarnings("deprecation")
	public SessionFactory getSessionFactory() {
		if(sessionFactory == null) {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		}
		return sessionFactory;
	}
}
