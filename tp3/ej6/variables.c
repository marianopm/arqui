//variables1
int foo1(){
    int numero;
}
                            //En el primero se declara, y en el segundo se declara y se define
//variables2
int foo2(){
    int numero=21;
}

//variables3
int numero;
int foo3(){
    numero=21;
}
                            //En el tercero se declara como variable global afuera de la func
//variables4                //y se define adentro, en el cuarto se declara como variable estatica
int foo(){                  //(es decir, se preserva entre llamadas) adentro de la func 
    static int numero=21;   //y se define ahi tambien
}

//variables5
extern int numero;
int foo(){
    numero = 10;
}
                            //En el quinto, se declara numero como variable externa (definida
int numero = 21;            //otro lado) y se la vuelve a definir como 10. En otro archivo se define
int bar(){                  //y declara, y luego adentro de la funcion se declara con un valor nuevo
    numero = 30;
}

//variables6
static int numero=10;
int foo(){                  //En el sexto, se define y declara numero como variable privada
    numero=20;              //y se vuelve a declarar adentro de la funcion
}

