package modelos;
import java.util.ArrayList;
import java.util.Collections;
public class Mazo {
    private ArrayList<Carta> mazo;
    public Mazo(){
        this.init();
        this.barajar();
    }

    private void init(){
        mazo = new ArrayList<Carta>();
        for(int i = 0; i < 40;i++)
            mazo.add(new Carta(i));
        
    }

    public void barajar(){
        Collections.shuffle(mazo);
    }

    public Carta extrae(){
        return mazo.remove(0);
    }

    public int getCantidadRestantePalo(String palo) {
        int cantidad = 0;
        for (Carta carta : mazo) {
            if (carta.getPalo().equals(palo)) {
                cantidad++;
            }
        }
        return cantidad;
    }
    
    public int getCantidadRestanteNumero(String numero) {
        int cantidad = 0;
        for (Carta carta : mazo) {
            if (carta.getNumeroAsString().equals(numero)) {
                cantidad++;
            }
        }
        return cantidad;
    }

    public int size(){
        return mazo.size();
    }
    
    
}
