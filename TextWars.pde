class TextWars implements Animation {
  String[] text = {
    "Captítulo IV",
    "",
    "Hace mucho mucho tiempo, en una",
    "provincia muy muy cercana",
    "una mujer preciosa tuvo a bien",
    "fijarse en un patán greñudo.",
    "",
    "El susodicho caballero, cayó enamorado",
    "de la dama y quisó vivir grandes",
    "aventuras con ella.",
    "",
    "No pasó mucho tiempo hasta que ambos",
    "estuvieron juntos y empezaron a",
    "maquinar siniestros planes de",
    "dominación mundial.",
    "",
    "Mientras tanto, el destino fraguaba",
    "lo que iba a ser la mayor de sus",
    "aventuras. Traer al mundo una",
    "hermosa criatura que les uniría más.",
    "",
    "Sin duda, el amor que se profesaban era",
    "absoluto y sin dudas.",
    "",
    "TE AMO, MI VIDA."
  };
  
  PFont myFont;
  int textHeight = height / 15;
  
  TextWars() {
    myFont = createFont("Roboto", textHeight, true);
  }
  
  public boolean isEnded() {
    return true;
  }
  
  public void draw() {
    textAlign(CENTER);
    textFont(myFont);
    fill(229, 117, 58, 255);
 
    rotateX(radians(45.0f));
    translate(0, 100, 0);
    float py = (height - (float)textHeight) / 2.0f;
    
    translate(0, 0, 1);
    float th = (float)textHeight;
    
    for(String t: text) {
      text(t, width / 2.0f, py);
      py += th;
    }
  }
}