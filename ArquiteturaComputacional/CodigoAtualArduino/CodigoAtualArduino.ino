int pinoSensor = 0; // Saída do sensor na A0
float temperatura = 0; // temperatura lida


// Função que será executada uma vez (setup):
void setup() {
  Serial.begin(9600); // Inicia a comunicação serial a 9600 bauds
}

// Função executada continuamente (loop):
void loop() {
  temperatura = (analogRead(pinoSensor) * 0.00488); // 5 volts / 1.023 = 0,0048 precisão do A/D (0,0048V ~= 1ºC)
  // temperatura = temperatura - 25; // Ajuste da temperatura para simulação do ambiente;
  Serial.println(temperatura);

  delay(10000);
}

