package com.financing.utils;

import org.hibernate.HibernateException;
import org.hibernate.MappingException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.dialect.Dialect;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.Configurable;
import org.hibernate.id.IdentifierGenerator;
import org.hibernate.type.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.Serializable;
import java.util.Properties;

/**
 * @author Penny
 * 自动生成自定义主键
 */
@Component
public class IDGenerator implements Configurable,IdentifierGenerator {

    @Autowired
    private SessionFactory sessionFactory;

    public  static IDGenerator idGenerator;

    public String sign;
    public String classname;
    public String pk;
    public String numLength;


    @PostConstruct
    public void init(){
        idGenerator =this;
    }

    @Override
    public void configure(Type type, Properties properties, Dialect dialect) throws MappingException {
        this.classname = properties.getProperty("classname");
        this.pk=properties.getProperty("pk");
        this.sign=properties.getProperty("sign");
        this.numLength=properties.getProperty("numLength");
    }

    @Override
    public Serializable generate(SessionImplementor sessionImplementor, Object o) throws HibernateException {


        int length = Integer.valueOf(numLength);
        String random_pk = null;

        Session session = idGenerator.sessionFactory.openSession();

        do {
            random_pk =CreateIdUtil.generateSequId(length);
        }while (session.get(classname,random_pk)!=null);
        session.close();

        return sign+random_pk;
    }
}
