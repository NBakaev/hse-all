package ru.nbakaev.matrix;

public class MainConsoleInput {

    public static void main(String[] args) {

        Matrix matrix = Matrix.buildMatrixFromCommandLine();
        matrix.print();
    }
}
