import java.lang.Math;

class Cordic{
    float x;
    float y;
}

class myMath {

    float floatMaxValue = 3.4028235f * _pow(10, 38);
    float PI = 3.141592653589793f;
    float PI1 = 3.141592f;
    float PI2 = 6.535897f;
    float PI3 = 93f;
    int biais = 127;
    int mantissaSize = 23;
    
    

    float _mod(float x, float y){
        if(y == 0) throw new IllegalArgumentException(" y = 0 impossible ");
        float res = x / y;
        return x - (int)res * y;
    }

    int _occurrence(float x, float y){
        if (y == 0 ) throw new IllegalArgumentException("the second argument must be different from y = 0");
        return (int) (y/x);
    }

    float _abs(float f){
        if(f<0){
            return -f;
        }
        return f;
    }

    float _pow(float base, int exponent) {
        // Base case: any number raised to the power of 0 is 1
        if (exponent == 0) {
            return 1;
        }
    
        // Handle negative exponent by inverting the base and making the exponent positive
        if (exponent < 0) {
            base = 1 / base;
            exponent = -exponent;
        }
    
        float halfPow = _pow(base, exponent / 2);
    
        // If the exponent is even
        if (_mod(exponent, 2) == 0) {
            return halfPow * halfPow;
        } else {
            // Else if the exponent is odd
            return base * halfPow * halfPow;
        }
    }
    
    // Utilisation of Héron method to approximate square root fonction 
    float _sqrt(float f){
        if(f<0){
            throw new IllegalArgumentException("tout nombre passé à la racine carrée doit être positif");
        }
        float epsilon = _pow(10, -5);
        float x0, x1 = f / 2.0f;
        do {
            x0 = x1;
            x1 = (x0 + f / x0) / 2.0f; 
        }  
        while ( _abs(x0 - x1) > epsilon );
        return x1;
    }

    int _fact(int x){
        if (x==1 || x==0){
            return 1;
        }
        return x*_fact(x-1);
    }

    float _taylor(int whichOne, int order, float f){
        if(_abs(f)>1) throw new IllegalArgumentException("Taylor Development available only between -1 and 1 strictly");
        if(order<0)  throw new IllegalArgumentException("Order need to be greater than 0");
        if(whichOne>3 || whichOne<0)  throw new IllegalArgumentException("WhichOne must be between 0 and 3");
        float res=0;
        int n = 0;
        // whichOne = 0 is the case of sin
        if (whichOne == 0){
            while (2*n+1<=order){
                res = res + ( _pow(-1, (int)_mod(n,2)) * _pow(f, 2*n+1) ) / _fact(2*n+1);
                // System.out.println("res = " + res);
                n = n+1;
            }
        }
        // whichOne = 1 is the case of cos
        else if (whichOne == 1){
            while (2*n<=order){
                res = res + ( _pow(-1, (int)_mod(n,2)) * _pow(f, 2*n) ) / _fact(2*n);
                n = n+1;
            }
        }
        // whichOne = 2 is the case of asin
        else if (whichOne == 2){
            while (2*n+1<=order){
                res = res + ( _fact(2*n) * _pow(f, 2*n+1) ) / ( _pow(2, 2*n) * _pow(_fact(n),2) * (2*n+1));
                n = n+1;
            }
        }
        // whichOne = 3 is the case of atan
        else if (whichOne == 3){
            while (2*n+1<=order){
                res = res + ( _pow(-1, (int)_mod(n,2)) * _pow(f, 2*n+1) ) / (2*n+1);
                n = n+1;
            }
        }
        return res;
    }


    // Division by 2 and Modulo PI1 can cause accuracy problems... PI1 is the float approximation of the real PI1
    float sin(float f) {
        // System.out.println("bonjour");
        // System.out.println(" f_sin  = "+ f);
        // int sign = 0;
        if(_abs(f)<0.5){
            return _taylor(0, 20, f);
        }
        else if(_abs(PI1 - f)<0.3){
            return cos(f-PI1/2);
        }
        // if( f< 0 ) {
        //     sign = 1;
        //     f = -f;
        // }
        // f = _mod(f, PI1/8) - _occurrence(PI1/8, f) * ulp(PI1/8);
        
        // System.out.println("f/2 = " + f/2 + " sin(f/2) = " + sin(f/2) +" cos(f/2) = " + cos(f/2));
        float res = 2 * sin( f/2 ) * cos( f/2 );
        // System.out.println(" f  = "+ f + " sin f  = "+ res + " " + (float)Math.sin(f));
        return res;
    }

    float cos(float f) {
        // System.out.println(" f_cos  = "+ f);

        if(_abs(f)<0.5){
            return _taylor(1, 20, f);
        }
        // else if(_abs(PI1/2 - f)<0.3){
        //     return sin(PI1/2 - f);
        // }
        if( _abs(f) > 2*PI) f = _mod(f, 2*PI);

        float res = 2 * _pow(cos(f/2), 2) - 1;
        // System.out.println(" f  = "+ f +" cos f  = "+ res + " " + (float)Math.cos(f) + " " + cos(0.375f));

        return res;
    }

    float asin(float f) {
        if(_abs(f)<0.3){
            return _taylor(2, 30, f);
        }
        else if(_abs(f)<1){
            /*  Dichotomic search based on these equations : 
            *               sin(arccos(x)) = sqrt(1-x²)
            *               arcsin(x) = PI1/2 - arccos(x)
            */
            int sign = 0;
            if (0>f) {
                sign = 1;
                f = -f;
            }
            float min = -PI1/2, max = PI1/2;
            float wanted = _sqrt(1 - _pow(f, 2));
            float obtained = 0;

            float eps = _pow(10, -7);
            while(_abs(sin(obtained)-wanted)>eps){
                if(sin(obtained)<wanted){
                    min = max-(max-min)/2;
                }
                else max = max-(max-min)/2;
                obtained = max-(max-min)/2;
            }
            return _pow(-1, sign) * (PI1/2 - obtained);
        }
        throw new IllegalArgumentException("Asin definition domain is restricted to [-1, 1]");
    }

    float atan(float f) {
        if(_abs(f)<=1){
            return _taylor(3, 50, f);
        }
        // System.out.println("atan(f) implemented based on taylor devlopment up to the 7th order");
        return PI1/2 - atan(1/f);
    }

    // 
    


    /*  Utility fonction in order to convert a float to his binary equivalent
    * i.d., according to the IEEE 754 standard displaying float in 32 bits : 
    *  float = (-1)^(sign) * exponent * mantissa
    * we will assume the biais is 127 
    */
    int _overOneFloatToBinary(float toBeConverted) {
        int copyToBeConverted = (int)toBeConverted, hasBeenConverted = 0;
        int parcours = 1, counter = 0;
        int sign = 0;
        int tmpCounter, decrement, mantisse;
       

        // Sign gestion
        if(copyToBeConverted<0){
            sign = 1;
            copyToBeConverted = -copyToBeConverted;
        }

        // Construction of floor part
        while (copyToBeConverted != 0) {
            if (copyToBeConverted % 2 == 1) {
                hasBeenConverted |= parcours;
            }
            copyToBeConverted = copyToBeConverted / 2;
            parcours = parcours * 2;
            counter++;
        }
        tmpCounter = counter;
        // System.out.println("Counter = " + counter + " Binary representation of hasBeenConverted " + Integer.toBinaryString(hasBeenConverted));

        // Construction of mantissa 
        decrement = 23;
        mantisse = 0;
        parcours = parcours / 2;
        counter = counter - 1;
        while (decrement != 0  && parcours != 1){
            decrement = decrement - 1;
            counter = counter - 1;
            parcours = parcours / 2;
            // System.out.println((hasBeenConverted & parcours)>>counter);
            // System.out.println(_mod((int)(hasBeenConverted / parcours), 2));
            if(_mod((int)(hasBeenConverted / parcours), 2) == 1){
                // System.out.println("decr = " + decrement +" mantisse = " + Integer.toBinaryString(mantisse));
                mantisse = mantisse + (int)_pow(2, decrement);
                // System.out.println("Binary representation of mantisse " + Integer.toBinaryString(mantisse));
            }
            // System.out.println(decrement);
            // System.out.println(parcours);
        }
        // System.out.println("Binary representation of mantisse " + Integer.toBinaryString(mantisse));
        hasBeenConverted = mantisse;
        // System.out.println("Binary representation of hasBeenConverted " + Integer.toBinaryString(hasBeenConverted));

        // Construction of exponent
        int exponent = 127 + tmpCounter - 1;
        // System.out.println(exponent + " en binaire : " + Integer.toBinaryString(exponent));
        hasBeenConverted = hasBeenConverted + (int)(exponent * _pow(2, 23));
        // System.out.println("Binary representation of hasBeen " + Integer.toBinaryString(hasBeenConverted));

        // Add the sign part
        // System.out.println("sign = "+sign);
        hasBeenConverted = hasBeenConverted + (int)(sign * _pow(2, 31));
        // System.out.println("Binary representation of mantisse " + Integer.toBinaryString(hasBeenConverted));

        return hasBeenConverted;
    }

    int _belowOneFloatToBinary(float toBeConverted){
        float copyToBeConverted = toBeConverted;
        int exponent = -1;
        while ((int)(copyToBeConverted / 2) == 0){
            copyToBeConverted = copyToBeConverted * 2;
            exponent = exponent + 1;
        }
        exponent = (-exponent + 127) * (int)_pow(2, 23);
        return exponent;
    }

    float ulp(float f) {
        if(f == floatMaxValue || f == 0){
            return _abs(f);
        }
        int fBin;
        if (f>=1) fBin = _overOneFloatToBinary(f);
        else fBin = _belowOneFloatToBinary(f);
        int exponent = (int)_mod((int)(fBin / _pow(2, 23)), (_pow(2, 8)));
        return _pow(2, exponent - biais - mantissaSize); 
    }
}



// float atanPow2(int k) {
    //     return atan(_pow(2, -k));
    // }
    
    // Cordic _cordic(float alpha, int sign1, int sign2, int sign3, int sign4, int signBoth) {
    //     float x = 1, y = 0;
    //     int k = 0;
    
    //     while (k < 30 && alpha < atanPow2(k)) {
    //         float factor = (float) _pow(2, -k);
    //         float x2 = x - y * factor;
    //         float y2 = y + x * factor;
    //         x = x2;
    //         y = y2;
    //         alpha -= atanPow2(k++);
    //     }
    
    //     int flipSign = 0;
    //     while (alpha > PI1) {
    //         alpha -= PI1;
    //         flipSign = 1;
    //     }
    
    //     int sign;
    //     if (alpha < -PI1 / 2) {
    //         alpha += PI1;
    //         sign = sign1;
    //     } else if (alpha < 0) {
    //         alpha = -alpha;
    //         sign = sign2;
    //     } else if (alpha < PI1 / 2) {
    //         sign = sign3;
    //     } else {
    //         alpha = PI1 - alpha;
    //         sign = sign4;
    //     }
    
    //     if (flipSign == 1 && signBoth == 1) {
    //         sign = -sign;
    //     }
    
    //     Cordic c = new Cordic();
    //     c.x = sign * x;
    //     c.y = (signBoth == 1) ? sign * y : y;
    //     return c;
    // }