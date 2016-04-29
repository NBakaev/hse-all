package ru.nbakaev.matrix;

import java.text.DecimalFormat;
import java.util.Scanner;

/**
 * Created by Nikita Bakaev, ya@nbakaev.ru on 2/7/2016.
 * All Rights Reserved
 */

/**
 * This class is immutable
 */
final public class Matrix {
    private final int M;             // number of rows
    private final int N;             // number of columns
    private final double[][] data;   // M-by-N array

    private static DecimalFormat df2 = new DecimalFormat("#.##");

    // create M-by-N matrix of 0's
    public Matrix(int M, int N) {
        this.M = M;
        this.N = N;
        data = new double[M][N];
    }

    // create matrix based on 2d array
    public Matrix(double[][] data) {
        M = data.length;
        N = data[0].length;
        this.data = new double[M][N];
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                this.data[i][j] = data[i][j];
    }

    // copy constructor
    private Matrix(Matrix A) {
        this(A.data);
    }

    // create and return a random M-by-N matrix with values between 0 and 1
    public static Matrix random(int M, int N) {
        Matrix A = new Matrix(M, N);
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                A.data[i][j] = Math.random();
        return A;
    }

    /**
     * create and return the N-by-N identity matrix
     1 0 0 0 0
     0 1 0 0 0
     0 0 1 0 0
     0 0 0 1 0
     0 0 0 0 1
     * @param N
     * @return
     */
    public static Matrix identity(int N) {
        Matrix I = new Matrix(N, N);
        for (int i = 0; i < N; i++)
            I.data[i][i] = 1;
        return I;
    }

    // swap rows i and j
    public void swap(int i, int j) {
        double[] temp = data[i];
        data[i] = data[j];
        data[j] = temp;
    }

    // create and return the transpose of the invoking matrix
    public Matrix transpose() {
        Matrix A = new Matrix(N, M);
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                A.data[j][i] = this.data[i][j];
        return A;
    }

    // return C = A + B
    public Matrix plus(Matrix B) {
        Matrix A = this;
        if (B.M != A.M || B.N != A.N) throw new RuntimeException("Illegal matrix dimensions.");
        Matrix C = new Matrix(M, N);
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                C.data[i][j] = A.data[i][j] + B.data[i][j];
        return C;
    }


    // return C = A - B
    public Matrix minus(Matrix B) {
        Matrix A = this;
        if (B.M != A.M || B.N != A.N) throw new RuntimeException("Illegal matrix dimensions.");
        Matrix C = new Matrix(M, N);
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                C.data[i][j] = A.data[i][j] - B.data[i][j];
        return C;
    }

    public Matrix timesScalar (double scalar){
        Matrix A = new Matrix(this);

        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                A.data[j][i] = A.data[j][i] * scalar;
        return A;
    }


    /**
     * does A = B exactly?
     *
     * @param o
     * @return
     */
    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Matrix)) return false;
        Matrix B = (Matrix) o;
        Matrix A = this;
        if (B.M != A.M || B.N != A.N) return false;
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                if (A.data[i][j] != B.data[i][j]) return false;
        return true;
    }

    public double determinant(Matrix matr){ //method sig. takes a matrix (two dimensional array), returns determinant.
        double[][] matrix = matr.data;
        int sum=0;
        int s;
        if(matrix.length==1){  //bottom case of recursion. size 1 matrix determinant is itself.
            return(matrix[0][0]);
        }
        for(int i=0;i<matrix.length;i++){ //finds determinant using row-by-row expansion
            double[][]smaller= new double[matrix.length-1][matrix.length-1]; //creates smaller matrix- values not in same row, column
            for(int a=1;a<matrix.length;a++){
                for(int b=0;b<matrix.length;b++){
                    if(b<i){
                        smaller[a-1][b]=matrix[a][b];
                    }
                    else if(b>i){
                        smaller[a-1][b-1]=matrix[a][b];
                    }
                }
            }
            if(i%2==0){ //sign changes based on i
                s=1;
            }
            else{
                s=-1;
            }
            sum+=s*matrix[0][i]*(determinant( new Matrix( smaller )));
//            recursive step: determinant of larger determined by smaller.
        }
        return(sum); //returns determinant value. once stack is finished, returns final determinant.
    }

    // return C = A * B
    public Matrix times(Matrix B) {
        Matrix A = this;
        if (A.N != B.M) throw new RuntimeException("Illegal matrix dimensions.");
        Matrix C = new Matrix(A.M, B.N);
        for (int i = 0; i < C.M; i++)
            for (int j = 0; j < C.N; j++)
                for (int k = 0; k < A.N; k++)
                    C.data[i][j] += (A.data[i][k] * B.data[k][j]);
        return C;
    }

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < M; i++) {
            for (int j = 0; j < N; j++) {
                stringBuilder.append( df2.format(data[i][j]) );
                stringBuilder.append(" ");
            }
            stringBuilder.append("\r\n");
        }
        return stringBuilder.toString();
    }

    // print matrix to standard output
    public void print() {
        System.out.println(toString());
    }


    ////////////////////////////////////////////////////////////////////////////////////
    /////////           Helpers to get matrix from STD  cmd         ////////////////////
    ////////////////////////////////////////////////////////////////////////////////////

    public static Matrix buildMatrixFromCommandLine (){

        int M = 0;
        int N = 0;
        double[][] data;

        M = new Double(getDoubleWithMessage("Enter rows number: ")).intValue();
        N = new Double(getDoubleWithMessage("Enter columns number: ")).intValue();
        System.out.println("You have matrix: " + M + "x" + N);

        data = new double[M][N];

        for (int i = 0; i < M; i++){
            System.out.println("Row: " + i);
            for (int j = 0; j < N; j++){
                data[i][j] = getDoubleWithMessage("Column: " + j);
            }
        }
        return new Matrix(data);
    }

    private static double getDouble() {
        try {
            Scanner sc = new Scanner(System.in);
            return sc.nextDouble();
        } catch (java.util.InputMismatchException i) {
            System.out.println("Error!");
            return getDouble();
        }
    }

    private static double getDoubleWithMessage(String message) {
        System.out.println();
        System.out.println(message);
        return getDouble();
    }

}