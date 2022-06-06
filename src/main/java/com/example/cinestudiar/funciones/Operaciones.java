package com.example.cinestudiar.funciones;

import java.util.ArrayList;

public class Operaciones {
    public static <T> ArrayList<T> quitarDuplicados(ArrayList<T> list)
    {
        ArrayList<T> newList = new ArrayList<T>();
        for (T element : list) {
            if (!newList.contains(element)) {

                newList.add(element);
            }
        }
        return newList;
    }
}
