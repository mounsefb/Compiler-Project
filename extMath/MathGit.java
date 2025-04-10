class MathGit {

    // Fonction de calcul de puissance de flottants
     float _puiss(float f, int n ) {

	if ( n == 0 ) {
	    return 1.0f ;
	}
	return f;
    }
    

    // Fonction racine par la méthode de Newton
     float _racine(float f) {
	
	float x0 = 1.0f;
	float precision = 0.0001f;
	
	if ( f == 0.0f || f == 1.0f ) {
	    return f ;
	}
	
        while ( (x0*x0 - f > precision) || (f - x0*x0 > precision) ) {
            x0 = (x0 + f/x0)/2.0f;		
	}
	
	return x0 ;
    }

     //  Calcul de l'arctan par l'approximant de Padé
    float atan(float f) {

	float coeff0 = 1.0f;
	float coeff2 = 10.0f/9.0f;
	float coeff3 = 7.0f/9.0f;
	float coeff4 = 5.0f/21.0f;
	float coeff5 = 64.0f/945.0f;

	float inverse = 1.0f/f;
	float approximation_pi = 3.14159265f;

	if ( f < 0.0f ) {
	   return -atan(-f);
	} else if ( f > 1.0f ) {
	   return -atan(inverse)+approximation_pi/2.0f;
	} else {
	   return (f+coeff3*this._puiss(f,3)+coeff5*this._puiss(f,5))/(coeff0+coeff2*this._puiss(f,2)+coeff4*this._puiss(f,4));
	}
    }

    //  Calcul de l'arcsin par l'identité arcsin(x) = arctan(x/(1-x**2)**0.5)
    float asin(float f) {
	
	float approximation_pi = 3.14159265f;

	if ( f < 0.0f ) {
	   return -asin(-f);
	} else if ( f == 1.0f ) {
	  return approximation_pi/2.0f;
	} else if ( f > 1.0f ) {
	  return 0.0f;
	} else {
	  return this.atan(f / this._racine(1.0f-f*f));
	}
	  
    }

    
    //   Calcul de l'arccos par l'identité arccos(x) + arcsin(x) = pi/2
    float acos(float f ) {
	
	float approximation_pi = 3.14159265f;

	return approximation_pi/2.0f - this.asin(f);
    }

    /*
      Calcul récursif de la fonction sin par développement de Taylor :
      On utilise la relation entre le terme du rang i+1 et celui
      du rang i pour améliorer nos calculs
    */    
    float sin(float f) {

	float res = 1.0f;
	float terme_rang_i = 1.0f;
	float valide = 2.0f;
	float i = 29.0f ;

	if ( f < 0.0f ) {
	   return -this.sin(-f);
	}

	if ( f > valide ) {
	   return 2.0f*this.sin(f/2.0f)*this.cos(f/2.0f);
	}
	
	while ( i > 2.0f )  {
	    terme_rang_i = ( -terme_rang_i*(f*f) ) / (i*(i+1.0f) ) ;
	    res = res + terme_rang_i ;
	    i = i - 2.0f;
	}
	
	return f*res;
    }

    //  Calcul récursif de la fonction cos par développement de Taylor
    float cos(float f) {

	float res = 1.0f;
	float terme_rang_i = 1.0f;
	float valide = 2.0f;
	float i = 29.0f ;

	if ( f < 0.0f ) {
	   return this.cos(-f);
	}

	if ( f > valide ) {
	   return 2.0f*this.cos(f/2.0f)*this.cos(f/2.0f)-1.0f;
	}
	
	while ( i > 2.0f )  {
	    terme_rang_i = ( -terme_rang_i*(f*f) ) / (i*(i+1.0f) ) ;
	    res = res +terme_rang_i ;
	    i = i - 2.0f;
	}

	return res;
    }


    float ulp(float f) {
	
	float demi = 0.5f;
	float a = 1.0f;
	float b = -1.0f;
	
	if ( f <= 1.0f && f >= -1.0f ) {
	    if ( f == 1.0f || f == 0.0f ) {
		return f*this._puiss(demi,23);
	    } else if ( f <= 1.0f && f >= 0.0f ) {
		while ( a > f ) {
		    a = a/2.0f;
		}
		return a*this._puiss(demi,23);
	    } else {
	
		while ( b < f ) {
		    b = b / 2.0f;
		}
		return b*this._puiss(demi,24);	
	    }
	    
	} else { 
	    if ( f > 1 ) {
		
	       	while ( a < f ){
		    a = a*2.0f;
		}
		return b*this._puiss(demi,24);	
	    } else { 
		
		while ( b > f ) {
		    b = b*2.0f;
		}
		return b*this._puiss(demi,23);
	    }
	}
    }

}