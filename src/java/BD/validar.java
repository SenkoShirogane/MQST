package BD;

public class validar {
    
    public String texto;
    public String mensaje;

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }
    
    public String espacios(String text){
        
        this.texto = text;
        char[] arreglo;
        arreglo = this.texto.toCharArray();
        char valor;
        char valor1, valor2;
        for(int i = 0; i < arreglo.length; i++){
            valor = arreglo[i];
            
            if(valor == ' '){
                int a = i;
                int b = i;
                a--;
                b++;
                if(a < 0){
                   a = i; 
                   if(valor == ' '){
                      this.mensaje = "No"; 
                      break;
                   }
                }
                if(b >= arreglo.length){
                    b = i;
                    if(valor == ' '){
                      this.mensaje = "No"; 
                      break;
                   }
                }
                
                valor1 = arreglo[a];
                valor2 = arreglo[b];
                if(valor1 == ' ' && valor2 == ' '){//Primer caso: un - - -
                    this.mensaje = "No"; 
                    break;
                }
                else{
                    if(valor1 != ' ' && valor2 == ' '){//Segundo caso: a - -
                       this.mensaje = "No"; 
                       break;
                    }else{
                        if(valor1 != ' ' && valor2 !=' '){
                            this.mensaje = "Si";
                            break; 
                        }else{
                           this.mensaje = "Si";
                       break; 
                        }
                       
                    }
                }
                
            }
        }
        
        return this.mensaje;
    }
    
    
    public String nombreLong(String text){
        this.texto = text;
        char[] arreglo;
        arreglo = this.texto.toCharArray();
        int numeroLong = 0;
        numeroLong = arreglo.length;
        
        if(numeroLong < 3){
           this.mensaje = "No"; 
        }
        else{
            if(numeroLong >= 3){
                if(numeroLong > 20){
                    this.mensaje = "No";
                }else{
                    if(numeroLong <= 20){
                        this.mensaje ="Si";
                    }
                    else{
                        this.mensaje = "err";                    }
                }
            }
            else{
                this.mensaje = "err";
            }
        }

       return this.mensaje; 
    }
/*    
    public String soloLetras(String text){
        this.texto = text;
        char[] arreglo;
        arreglo = this.texto.toCharArray();
        char valor;
        for(int i = 0; i < arreglo.length; i++){
            valor = arreglo[i];
            
            if(valor != ' ' || valor != 'a' || valor != 'b' || valor != 'c' || valor != 'd' || valor != 'e' || valor != 'f' || valor != 'g' || valor != 'h' || valor != 'i' || valor != 'j' || valor != 'k' || valor != 'l' || valor != 'm' || valor != 'n' || valor != 'ñ' || valor != 'o' || valor != 'p' || valor != 'q' || valor != 'r' || valor != 's' || valor != 't' || valor != 'u' || valor != 'v' || valor != 'w' || valor != 'x' || valor != 'y' || valor != 'z'){
                this.mensaje = "No";
                break;
            }else{
               if(valor != 'A' || valor != 'B' || valor != 'C' || valor != 'D' || valor != 'E' || valor != 'F' || valor != 'G' || valor != 'H' || valor != 'I' || valor != 'J' || valor != 'K' || valor != 'L' || valor != 'M' || valor != 'N' || valor != 'Ñ' || valor != 'O' || valor != 'P' || valor != 'Q' || valor != 'R' || valor != 'S' || valor != 'T' || valor != 'U' || valor != 'V' || valor != 'W' || valor != 'X' || valor != 'Y' || valor != 'Z'){
                    this.mensaje = "No";
                    break;
                } 
               else{
                   this.mensaje = "Si";
                   break;
               }
            }
        }
        return this.mensaje;
    }*/
    
    public String soloLetras(String text){
        this.texto = text;
        char[] arreglo;
        arreglo = this.texto.toCharArray();
        char valor;
        for(int i = 0; i < arreglo.length; i++){
            valor = arreglo[i];
            
            if(valor != ' '){
               if(valor != 'a'){
                   if(valor != 'b'){
                      if(valor != 'c'){
                         if(valor != 'd'){
                            if(valor != 'e'){
                                if(valor != 'f'){
                                    if(valor != 'g'){
                                        if(valor != 'h'){
                                            if(valor != 'i'){
                                                if(valor != 'j'){
                                                    if(valor != 'k'){
                                                        if(valor != 'l'){
                                                            if(valor != 'm'){
                                                                if(valor != 'n'){
                                                                    if(valor != 'c'){
                                                                        if(valor != 'c'){
                                                                            if(valor != 'c'){
                                                                                if(valor != 'c'){
                                                                                    if(valor != 'c'){
                                                                                        if(valor != 'c'){
                                                                                            if(valor != 'c'){
                                                                                                if(valor != 'c'){
                                                                                                    if(valor != 'c'){
                                                                                                        if(valor != 'c'){
                                                                                                            if(valor != 'c'){
                                                                                                                if(valor != 'c'){
                                                                                                                    this.mensaje = "No";
                                                                                                                }else{
                   this.mensaje = "Si";
               }
                                                                                                            }else{
                   this.mensaje = "Si";
               }
                                                                                                        }else{
                   this.mensaje = "Si";
               }
                                                                                                    }else{
                   this.mensaje = "Si";
               }
                                                                                                }else{
                   this.mensaje = "Si";
               }
                                                                                            }else{
                   this.mensaje = "Si";
               }
                                                                                        }else{
                   this.mensaje = "Si";
               }
                                                                                    }else{
                   this.mensaje = "Si";
               }
                                                                                }else{
                   this.mensaje = "Si";
               }
                                                                            }else{
                   this.mensaje = "Si";
               }
                                                                        }else{
                   this.mensaje = "Si";
               }
                                                                    }else{
                   this.mensaje = "Si";
               }
                                                                }else{
                   this.mensaje = "Si";
               }
                                                            }else{
                   this.mensaje = "Si";
               }
                                                        }else{
                   this.mensaje = "Si";
               }
                                                    }else{
                   this.mensaje = "Si";
               }
                                                }else{
                   this.mensaje = "Si";
               }
                                            }else{
                   this.mensaje = "Si";
               }
                                        }else{
                   this.mensaje = "Si";
               }
                                    }else{
                   this.mensaje = "Si";
               }
                                }else{
                   this.mensaje = "Si";
               }
                            }else{
                   this.mensaje = "Si";
               }
                        }else{
                   this.mensaje = "Si";
               } 
                      }else{
                   this.mensaje = "Si";
               }
                   }else{
                        this.mensaje = "Si";
                    }
               }else{
                   this.mensaje = "Si";
               } 
            }else{
                this.mensaje = "Si";
            }
        }
        return this.mensaje;
    }
}
