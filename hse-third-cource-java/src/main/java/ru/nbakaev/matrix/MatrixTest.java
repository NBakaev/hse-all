package ru.nbakaev.matrix;

/**
 * Created by Nikita Bakaev, ya@nbakaev.ru on 2/7/2016.
 * All Rights Reserved
 */
public class MatrixTest {

    public static void main(String[] args) {

        double[][] d = {{1, 2, 3}, {4, 5, 6}, {9, 1, 3}};

        Matrix D = new Matrix(d);
        D.print();
        System.out.println();

        // детерминант
        System.out.println(D.determinant(D));
        System.out.println();

        // умножение на скаляр
        Matrix timesScalar = D.timesScalar(3);
        timesScalar.print();
        System.out.println();

        // случайные числа
        Matrix A = Matrix.random(5, 5);
        A.print();
        System.out.println();

        // минус матрица
        Matrix F = Matrix.random(5, 5);
        A.minus(F).print();
        System.out.println();

        // транспонировать
        Matrix B = A.transpose();
        B.print();
        System.out.println();

        // еденичная матрица
        Matrix C = Matrix.identity(5);
        C.print();
        System.out.println();

        // сложить
        A.plus(B).print();
        System.out.println();

        // умножить
        B.times(A).print();
        System.out.println();

        // equals() AB != BA
        System.out.println(A.times(B).equals(B.times(A)));
        System.out.println();

    }
}
