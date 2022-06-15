package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import model.AdminModel;
import model.DistrictModel;
import model.DivisionModel;
import model.SubAdminModel;

public class SubAdminDao {

	public List<SubAdminModel> getAllSubAdmins() {
		// TODO Auto-generated method stub
		List<SubAdminModel> sams = new ArrayList<>();
		String query = "from SubAdminModel sam";
		Connection con = new Connection();
		Session session = con.getSessionFactory().openSession();

		Query queryExecuteable = session.createQuery(query);
		sams = queryExecuteable.list();
		session.flush();
		session.close();

		con.closeSessionFactory();
		return sams;
	}

	public SubAdminModel getSubAdminById(int sadId) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String query = "from SubAdminModel sad where sad.id=" + sadId;
		Connection con = new Connection();
		Session session = con.getSessionFactory().openSession();

		Query queryExecuteable = session.createQuery(query);
		SubAdminModel subAdminModel = (SubAdminModel) queryExecuteable.list().get(0);
		con.closeSessionFactory();
		return subAdminModel;
	}

	public void deleteSubAdmin(SubAdminModel subAdminModel) {
		// TODO Auto-generated method stub
		Connection con = new Connection();

		Session session = con.getSessionFactory().openSession();

		Transaction transaction = session.beginTransaction();
		session.delete(subAdminModel);
		transaction.commit();
		session.flush();
		session.close();
		con.closeSessionFactory();
		System.out.println("Deleted...");
	}

	public void saveSubAdmin(SubAdminModel sam) {
		// TODO Auto-generated method stub
		Connection con = new Connection();

		Session session = con.getSessionFactory().openSession();

		Transaction transaction = session.beginTransaction();
		session.save(sam);
		transaction.commit();

		session.flush();
		session.close();

		con.closeSessionFactory();
		System.out.println("Inserted...");
	}

	public void updateSubAdmin(SubAdminModel sam) {
		// TODO Auto-generated method stub
		Connection con = new Connection();

		Session session = con.getSessionFactory().openSession();

		Transaction transaction = session.beginTransaction();
		session.update(sam);
		transaction.commit();
		session.flush();
		session.close();
		con.closeSessionFactory();
		System.out.println("Updated...");
	}

	public SubAdminModel getSubAdminByName(String name) {
		// TODO Auto-generated method stub
		String query = "from SubAdminModel adminModel where adminModel.adminName='"+name+"'";
		Connection con = new Connection();
		Session session = con.getSessionFactory().openSession();

		Query queryExecuteable = session.createQuery(query);
		SubAdminModel sam = new SubAdminModel();
		try {
			sam = (SubAdminModel) queryExecuteable.list().get(0);
		} catch (Exception e) {
			System.out.println("Problem with login...");
		}
		session.flush();
		session.close();
		con.closeSessionFactory();
		return sam;
	}

}
