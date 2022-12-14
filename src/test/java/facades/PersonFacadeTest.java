//package facades;
//
//import dtos.PersonDTO;
//import entities.*;
//import org.junit.jupiter.api.BeforeAll;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Disabled;
//import org.junit.jupiter.api.Test;
//import utils.EMF_Creator;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import java.util.*;
//
//import static org.junit.jupiter.api.Assertions.assertEquals;
//
////@Disabled
//public class PersonFacadeTest {
//    private static EntityManagerFactory emf;
//    private static PersonFacade facade;
//    Person p1, p2, p3;
//    Address a1, a2;
//    private List<Phone> phones = new ArrayList<>();
//    Phone ph1, ph2;
//    Hobby h1, h2, h3, h4, h5, h6;
//
//    public PersonFacadeTest() {
//    }
//
//    @BeforeAll
//    public static void setUpClass() {
//        emf = EMF_Creator.createEntityManagerFactoryForTest();
//        facade = PersonFacade.getPersonFacade(emf);
//    }
//
//    @BeforeEach
//    public void setUp() {
//        EntityManager em = emf.createEntityManager();
//        try {
//            em.getTransaction().begin();
//            em.createNamedQuery("Phone.deleteAllRows").executeUpdate();
//            em.createNamedQuery("Address.deleteAllRows").executeUpdate();
//            em.createNamedQuery("Person.deleteAllRows").executeUpdate();
//            em.createNamedQuery("Hobby.deleteAllRows").executeUpdate();
//
//            a1 = new Address("Noegaardsvej 30", 2800);
//            a2 = new Address("Lololol 10", 900);
//
//            h1 = new Hobby("3D-udskrivning", "https://en.wikipedia.org/wiki/3D_printing", "Generel", "Indendørs");
//            h2 = new Hobby("Akrobatik", "https://en.wikipedia.org/wiki/Acrobatics", "Generel", "Indendørs");
//            h3 = new Hobby("Skuespil", "https://en.wikipedia.org/wiki/Acting", "Generel", "Indendørs");
////            h4 = new Hobby("Amatørradio", "https://en.wikipedia.org/wiki/Amateur_radio", "Generel", "Indendørs");
////            h5 = new Hobby("Animation", "https://en.wikipedia.org/wiki/Animation", "Generel", "Indendørs");
////            h6 = new Hobby("Aquascaping", "https://en.wikipedia.org/wiki/Aquascaping", "Generel", "Indendørs");
//
//            p1 = new Person("markchomin@gmail.com", "Mark", "Chomin", a1);
//            p2 = new Person("gustavboegh@gmail.com", "Gustav", "Boegh", a2);
//
//            ph1 = new Phone(29842712, "HOME", p1);
//            ph2 = new Phone(12345678, "WORK");
//
//            p1.getHobbies().add(h1);
//            p1.getHobbies().add(h2);
//            p2.getHobbies().add(h1);
////            p2.getHobbies().add(h4);
////            p3.getHobbies().add(h5);
////            p3.getHobbies().add(h6);
//
//            em.persist(h1);
//            em.persist(h2);
//            em.persist(h3);
//
//            em.persist(ph1);
//            em.persist(ph2);
//
//            em.persist(p1);
//            em.persist(p2);
////            em.persist(p3);
//
//            em.getTransaction().commit();
//        } finally {
//            em.close();
//        }
//    }
//
//    @Test
//    void createPersonTest() {
//        System.out.println("Testing create(PersonDTO pdto3)");
//        Address a3 = new Address("Lololol 10", 900);
//        p3 = new Person("Fido@dog.com", "Fido", "Lele", a3);
//        p3.setId(3);
//        PersonDTO pdto3 = new PersonDTO(p3);
//        PersonDTO expected = pdto3;
//        PersonDTO actual = facade.createPersonDTO(pdto3);
//        assertEquals(expected, actual);
//    }
//
//    @Test
//    void getAllPersonsTest() {
//        System.out.println("Testing getAllPersons()");
//        int expected = 2;
//        int actual = facade.getAllPersons().size();
//        assertEquals(expected,actual);
//    }
//
//
//    @Test
//    void updatePersonTest() {
//        System.out.println("Testing Update(Person p1)");
//        p1.setEmail("Test@Test.dk");
//        String expected = p1.getEmail();
//        String actual = facade.updatePerson(new PersonDTO(p1)).getEmail();
//        assertEquals(expected, actual);
//    }
//
//    // Virker hvis man ikke tilføjer phone number til personen. Måske vi skal fixe det med cascade.
//    @Test
//    void deletePersonTest() {
//        System.out.println("Testing delete(id)");
//        PersonDTO person = facade.deletePerson(p2.getId());
//        int expected = 1;
//        int actual = facade.getAllPersons().size();
//        assertEquals(expected, actual);
//        assertEquals(person, new PersonDTO(p2));
//    }
//
//    @Test
//    void getPersonByPhoneTest() {
//        System.out.println("Testing getPersonByPhone(phone)");
//        int expected = 1;
//        System.out.println(ph1.getPhoneNumber());
//        List<PersonDTO> actual = facade.getPersonByPhone(ph1.getPhoneNumber());
//        assertEquals(expected, actual.size());
//    }
//
//
//    @Test
//    void getAllPersonsByHobbyTest() {
//        System.out.println("Testing getNumberOfPeopleWithGivenHobby(string)");
//        int expected = p1.getHobbies().toArray().length;
//        List<PersonDTO> actual = facade.getAllPersonsByHobby("3D-udskrivning");
//        assertEquals(expected, actual.size());
//    }
//
//
//    @Test
//    void getPersonsByCityZipTest() {
//        System.out.println("Testing getPersonsByCityZipTest(zip)");
//        int expected = 1;
//        List<PersonDTO> actual = facade.getPersonsByCityZip(p1.getAddress().getZip());
//        assertEquals(expected, actual.size());
//    }
//}