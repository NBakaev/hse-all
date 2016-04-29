package ru.nbakaev.complex;

/**
 * Created by Nikita Bakaev, ya@nbakaev.ru on 2/8/2016.
 * All Rights Reserved
 */
public class Complex {

    private final double re;
    private final double im;

    public Complex(double re, double im) {
        this.re = re;
        this.im = im;
    }

    static public Complex polar(double r, double theta) {
        double im = r * Math.sin(theta);
        double re = r * Math.cos(theta);
        return new Complex(re, im);
    }

    public Complex plus(Complex rhs) {
        double _re = re + rhs.re;
        double _im = im + rhs.im;
        return new Complex(_re, _im);
    }

    public Complex minus(Complex rhs) {
        double _re = re - rhs.re;
        double _im = im - rhs.im;
        return new Complex(_re, _im);
    }

    public Complex times(Complex rhs) {
        double _re = re * rhs.re - im * rhs.im;
        double _im = im * rhs.re + re * rhs.im;
        return new Complex(_re, _im);
    }

    public Complex times(double x) {
        return new Complex(x * re, x * im);
    }

    public Complex divide(Complex rhs) {
        double theta0 = arg();
        double r0 = abs();
        double theta = rhs.arg();
        double r = rhs.abs();

        return polar(r0 / r, theta0 - theta);
    }

    public Complex divide(double x) {
        return new Complex(re / x, im / x);
    }

    public Complex power(double n) {
        double theta = arg();
        double r = abs();

        return polar(Math.pow(r, n), n * theta);
    }

    public Complex conjugate() {
        return new Complex(re, -im);
    }

    public double Re() {
        return re;
    }

    public double Im() {
        return im;
    }


    public double arg() {
        return Math.atan2(im, re);
    }

    public double abs() {
        return Math.sqrt(re * re + im * im);
    }

    public double norm() {
        return re * re + im * im;
    }

    public Complex sqrt() {
        double re_ = Math.sqrt((re + abs()) / 2);
        double im_ = Math.signum(im) * Math.sqrt((abs() - re) / 2);
        return new Complex(re_, im_);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Complex complex = (Complex) o;

        if (Math.abs(complex.re - re) > 1E-5) return false;
        return Math.abs(complex.im - im) < 1E-5;

    }

    @Override
    public String toString() {
        return "(" + re
                + (im > 0 ? '+' : '-')
                + Math.abs(im) + "j)";
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        temp = Double.doubleToLongBits(re);
        result = (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(im);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
