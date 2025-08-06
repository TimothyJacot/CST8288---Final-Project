/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package accessLayer;

import java.util.List;

/**
 *
 * @author IONET
 * @param <T>
 */
public interface DAO <T> {
    List<T> getAll();
    T getDAObyId(int id);
    void add(T object);
    void update(T object);
    void delete(int id);
}
